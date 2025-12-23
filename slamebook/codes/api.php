<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

// Database configuration
$host = 'localhost';
$dbname = 'aragon_slamebookdb';
$username = 'root';
$password = 'your_password_here';

// Create connection
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Connection failed: ' . $e->getMessage()
    ]);
    exit;
}

// Get action from request
$action = $_POST['action'] ?? $_GET['action'] ?? '';

// Handle different actions
switch($action) {
    case 'create':
        createEntry($pdo);
        break;
    case 'read':
        readEntry($pdo);
        break;
    case 'update':
        updateEntry($pdo);
        break;
    case 'delete':
        deleteEntry($pdo);
        break;
    case 'list':
        listEntries($pdo);
        break;
    case 'reports':
        generateReports($pdo);
        break;
    default:
        echo json_encode([
            'success' => false,
            'message' => 'Invalid action'
        ]);
}


// CREATE - Insert new entry (into 4 tables)
function createEntry($pdo) {
    try {
        $pdo->beginTransaction();

        // 1. Insert into USERS table
        $sql = "INSERT INTO USERS (FullName, NickName, BDay, Gender, ContactNumber, EmailAdd) 
                VALUES (:fullName, :nickName, :bday, :gender, :contactNumber, :emailAdd)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':fullName' => $_POST['fullName'] ?? null,
            ':nickName' => $_POST['nickName'] ?? null,
            ':bday' => $_POST['bday'] ?? null,
            ':gender' => $_POST['gender'] ?? null,
            ':contactNumber' => $_POST['contactNumber'] ?? null,
            ':emailAdd' => $_POST['emailAdd'] ?? null 
        ]);
        
        $userId = $pdo->lastInsertId();
    
        // 2. Insert into FAVORITES table
        $sql = "INSERT INTO FAVORITES (UserID, FColor, FFood, FMovie, FSeries, FArtist, FSong, FBook, FSubject, FHobby, FPlace, FSports) 
                VALUES (:userId, :fColor, :fFood, :fMovie, :fSeries, :fArtist, :fSong, :fBook, :fSubject, :fHobby, :fPlace, :fSports)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':userId' => $userId,
            ':fColor' => $_POST['fColor'] ?? null,
            ':fFood' => $_POST['fFood'] ?? null,
            ':fMovie' => $_POST['fMovie'] ?? null,
            ':fSeries' => $_POST['fSeries'] ?? null,
            ':fArtist' => $_POST['fArtist'] ?? null,
            ':fSong' => $_POST['fSong'] ?? null,
            ':fBook' => $_POST['fBook'] ?? null,
            ':fSubject' => $_POST['fSubject'] ?? null,
            ':fHobby' => $_POST['fHobby'] ?? null,
            ':fPlace' => $_POST['fPlace'] ?? null,
            ':fSports' => $_POST['fSports'] ?? null
        ]);

        // 3. Insert into PERSONALITY_TRAITS table
        $sql = "INSERT INTO PERSONALITY_TRAITS (UserID, FQuote, DreamJob, SuperPower, BiggestFear, HappiestMemory, PetPeeves, WordsThatDescribesYou) 
                VALUES (:userId, :fQuote, :dreamJob, :superPower, :biggestFear, :happiestMemory, :petPeeves, :wordsThatDescribesYou)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':userId' => $userId,
            ':fQuote' => $_POST['fQuote'] ?? null,  
            ':dreamJob' => $_POST['dreamJob'] ?? null,
            ':superPower' => $_POST['superPower'] ?? null,
            ':biggestFear' => $_POST['biggestFear'] ?? null,
            ':happiestMemory' => $_POST['happiestMemory'] ?? null,
            ':petPeeves' => $_POST['petPeeves'] ?? null,
            ':wordsThatDescribesYou' => $_POST['wordsThatDescribesYou'] ?? null  
        ]);
        

        // 4. Insert into RELATIONSHIPS table 
        $sql = "INSERT INTO RELATIONSHIPS (UserID, BestFriend, RelationshipStatus, CelebrityCrush, IdealDate, DreamWedding, Crush) 
                VALUES (:userId, :bestFriend, :relationshipStatus, :celebrityCrush, :idealDate, :dreamWedding, :crush)";  
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':userId' => $userId,
            ':bestFriend' => $_POST['bestFriend'] ?? null,
            ':relationshipStatus' => $_POST['relationshipStatus'] ?? null, 
            ':celebrityCrush' => $_POST['celebrityCrush'] ?? null,
            ':idealDate' => $_POST['idealDate'] ?? null,
            ':dreamWedding' => $_POST['dreamWedding'] ?? null,
            ':crush' => $_POST['crush'] ?? null
        ]);
        
        $pdo->commit();
        
        echo json_encode([
            'success' => true,
            'message' => 'Entry created successfully!',
            'id' => $userId
        ]);
        
    } catch(PDOException $e) {
        $pdo->rollBack();
        echo json_encode([
            'success' => false,
            'message' => 'Error creating entry: ' . $e->getMessage()
        ]);
    }
}

// READ - Get single entry (JOIN all tables)
function readEntry($pdo) {
    try {
        $id = $_GET['id'] ?? null;
        
        if (!$id) {
            echo json_encode(['success' => false, 'message' => 'ID is required']);
            return;
        }
        
        $sql = "SELECT u.*, f.*, p.*, r.*
                FROM USERS u
                LEFT JOIN FAVORITES f ON u.UserID = f.UserID
                LEFT JOIN PERSONALITY_TRAITS p ON u.UserID = p.UserID
                LEFT JOIN RELATIONSHIPS r ON u.UserID = r.UserID
                WHERE u.UserID = ?";
        
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$id]);
        $entry = $stmt->fetch();
        
        if ($entry) {
            echo json_encode(['success' => true, 'data' => $entry]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Entry not found']);
        }
        
    } catch(PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Error reading entry: ' . $e->getMessage()]);
    }
}

// UPDATE - Update existing entry (4 tables)
function updateEntry($pdo) {
    try {
        $userId = $_POST['userId'] ?? null;
        
        if (!$userId) {
            echo json_encode(['success' => false, 'message' => 'User ID is required']);
            return;
        }
        
        $pdo->beginTransaction();
        
        // 1. Update USERS table
        $sql = "UPDATE USERS SET FullName = :fullName, NickName = :nickName, BDay = :bday, 
                Gender = :gender, ContactNumber = :contactNumber, EmailAdd = :emailAdd 
                WHERE UserID = :userId";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':userId' => $userId,
            ':fullName' => $_POST['fullName'] ?? null,
            ':nickName' => $_POST['nickName'] ?? null,
            ':bday' => $_POST['bday'] ?? null,
            ':gender' => $_POST['gender'] ?? null,
            ':contactNumber' => $_POST['contactNumber'] ?? null,
            ':emailAdd' => $_POST['emailAdd'] ?? null
        ]);
        
        // 2. Update FAVORITES table
        $sql = "UPDATE FAVORITES SET FColor = :fColor, FFood = :fFood, FMovie = :fMovie, 
                FSeries = :fSeries, FArtist = :fArtist, FSong = :fSong, FBook = :fBook, 
                FSubject = :fSubject, FHobby = :fHobby, FPlace = :fPlace, FSports = :fSports 
                WHERE UserID = :userId";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':userId' => $userId,
            ':fColor' => $_POST['fColor'] ?? null,
            ':fFood' => $_POST['fFood'] ?? null,
            ':fMovie' => $_POST['fMovie'] ?? null,
            ':fSeries' => $_POST['fSeries'] ?? null,
            ':fArtist' => $_POST['fArtist'] ?? null,
            ':fSong' => $_POST['fSong'] ?? null,
            ':fBook' => $_POST['fBook'] ?? null,
            ':fSubject' => $_POST['fSubject'] ?? null,
            ':fHobby' => $_POST['fHobby'] ?? null,
            ':fPlace' => $_POST['fPlace'] ?? null,
            ':fSports' => $_POST['fSports'] ?? null
        ]);
        
        // 3. Update PERSONALITY_TRAITS table
        $sql = "UPDATE PERSONALITY_TRAITS SET FQuote = :fQuote, DreamJob = :dreamJob, 
                SuperPower = :superPower, BiggestFear = :biggestFear, HappiestMemory = :happiestMemory, 
                PetPeeves = :petPeeves, WordsThatDescribesYou = :wordsThatDescribesYou 
                WHERE UserID = :userId";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':userId' => $userId,
            ':fQuote' => $_POST['fQuote'] ?? null,
            ':dreamJob' => $_POST['dreamJob'] ?? null,
            ':superPower' => $_POST['superPower'] ?? null,
            ':biggestFear' => $_POST['biggestFear'] ?? null,
            ':happiestMemory' => $_POST['happiestMemory'] ?? null,
            ':petPeeves' => $_POST['petPeeves'] ?? null,
            ':wordsThatDescribesYou' => $_POST['wordsThatDescribesYou'] ?? null
        ]);
        
        // 4. Update RELATIONSHIPS table
        $sql = "UPDATE RELATIONSHIPS SET BestFriend = :bestFriend, RelationshipStatus = :relationshipStatus,  
        CelebrityCrush = :celebrityCrush, IdealDate = :idealDate, DreamWedding = :dreamWedding, 
        Crush = :crush WHERE UserID = :userId";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':userId' => $userId,
            ':bestFriend' => $_POST['bestFriend'] ?? null,
            ':relationshipStatus' => $_POST['relationshipStatus'] ?? null,  
            ':celebrityCrush' => $_POST['celebrityCrush'] ?? null,
            ':idealDate' => $_POST['idealDate'] ?? null,
            ':dreamWedding' => $_POST['dreamWedding'] ?? null,
            ':crush' => $_POST['crush'] ?? nulL
        ]);
        
        $pdo->commit();
        
        echo json_encode(['success' => true, 'message' => 'Entry updated successfully!']);
        
    } catch(PDOException $e) {
        $pdo->rollBack();
        echo json_encode(['success' => false, 'message' => 'Error updating entry: ' . $e->getMessage()]);
    }
}

// DELETE - Delete entry (cascades to all related tables)
function deleteEntry($pdo) {
    try {
        $id = $_POST['id'] ?? $_GET['id'] ?? null;
        
        if (!$id) {
            echo json_encode(['success' => false, 'message' => 'ID is required']);
            return;
        }
        
        $stmt = $pdo->prepare("DELETE FROM USERS WHERE UserID = ?");
        $stmt->execute([$id]);
        
        echo json_encode(['success' => true, 'message' => 'Entry deleted successfully!']);
        
    } catch(PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Error deleting entry: ' . $e->getMessage()]);
    }
}

// LIST - Get all entries (JOIN all tables)
function listEntries($pdo) {
    try {
        $sql = "SELECT u.*, f.*, p.*, r.*
                FROM USERS u
                LEFT JOIN FAVORITES f ON u.UserID = f.UserID
                LEFT JOIN PERSONALITY_TRAITS p ON u.UserID = p.UserID
                LEFT JOIN RELATIONSHIPS r ON u.UserID = r.UserID
                ORDER BY u.CreatedAt DESC";
        
        $stmt = $pdo->query($sql);
        $entries = $stmt->fetchAll();
        
        echo json_encode([
            'success' => true,
            'data' => $entries,
            'count' => count($entries)
        ]);
        
    } catch(PDOException $e) {
        echo json_encode(['success' => false, 'message' => 'Error listing entries: ' . $e->getMessage()]);
    }
}

// ===== REPORTS =====

function getBasicReports($pdo) {
    try {
        $basicReports = [];
        
        // 1: Total Users Count
        $stmt = $pdo->query("SELECT COUNT(*) as total FROM USERS");
        $basicReports['totalUsers'] = $stmt->fetch()['total'];
        
        // 2: Total Entries with Contact Info
        $stmt = $pdo->query("SELECT COUNT(*) as total FROM USERS WHERE ContactNumber IS NOT NULL AND EmailAdd IS NOT NULL");
        $basicReports['usersWithContact'] = $stmt->fetch()['total'];
        
        // 3: Gender Distribution
        $stmt = $pdo->query("SELECT Gender, COUNT(*) as count FROM USERS WHERE Gender IS NOT NULL GROUP BY Gender ORDER BY count DESC");
        $basicReports['genderDistribution'] = $stmt->fetchAll();
        
        // 4: Top 5 Relationship Status
        $stmt = $pdo->query("SELECT RelationshipStatus, COUNT(*) as count FROM RELATIONSHIPS WHERE RelationshipStatus IS NOT NULL GROUP BY RelationshipStatus ORDER BY count DESC LIMIT 5");
        $basicReports['relationshipStatus'] = $stmt->fetchAll();
        
        // 5: Recent 5 Entries
        $stmt = $pdo->query("SELECT UserID, FullName, NickName, CreatedAt FROM USERS ORDER BY CreatedAt DESC LIMIT 5");
        $basicReports['recentEntries'] = $stmt->fetchAll();
        
        return $basicReports;
    } catch(PDOException $e) {
        throw new Exception('Error in basic reports: ' . $e->getMessage());
    }
}

// ===== AGGREGATE REPORTS =====

function getAggregateReports($pdo) {
    try {
        $aggregateReports = [];
        
        // 1.User Statistics (COUNT, AVG Age, MIN/MAX Birthday)
        $stmt = $pdo->query("
            SELECT 
                COUNT(DISTINCT UserID) as totalUsers,
                COUNT(CASE WHEN Gender = 'Male' THEN 1 END) as maleCount,
                COUNT(CASE WHEN Gender = 'Female' THEN 1 END) as femaleCount,
                COUNT(CASE WHEN ContactNumber IS NOT NULL THEN 1 END) as contactsAvailable,
                ROUND(AVG(TIMESTAMPDIFF(YEAR, BDay, CURDATE())), 2) as avgAge,
                MIN(BDay) as oldestBirthday,
                MAX(BDay) as youngestBirthday
            FROM USERS
        ");
        $aggregateReports['userStatistics'] = $stmt->fetch();
        
        // 2.Favorites Statistics (Most Popular Items with COUNT and GROUP_CONCAT)
        $stmt = $pdo->query("
            SELECT 
                COUNT(DISTINCT UserID) as totalWithFavorites,
                (SELECT FColor FROM FAVORITES WHERE FColor IS NOT NULL GROUP BY FColor ORDER BY COUNT(*) DESC LIMIT 1) as mostPopularColor,
                (SELECT FFood FROM FAVORITES WHERE FFood IS NOT NULL GROUP BY FFood ORDER BY COUNT(*) DESC LIMIT 1) as mostPopularFood,
                (SELECT FMovie FROM FAVORITES WHERE FMovie IS NOT NULL GROUP BY FMovie ORDER BY COUNT(*) DESC LIMIT 1) as mostPopularMovie,
                (SELECT FHobby FROM FAVORITES WHERE FHobby IS NOT NULL GROUP BY FHobby ORDER BY COUNT(*) DESC LIMIT 1) as mostPopularHobby
            FROM FAVORITES
        ");
        $aggregateReports['favoritesAggregate'] = $stmt->fetch();
        
        // 3.Personality Traits Summary (COUNT, with SUM of non-null fields)
        $stmt = $pdo->query("
            SELECT 
                COUNT(DISTINCT UserID) as totalWithTraits,
                COUNT(DreamJob) as dreamJobCount,
                COUNT(SuperPower) as superpowerCount,
                COUNT(BiggestFear) as fearCount,
                COUNT(HappiestMemory) as memoryCount,
                COUNT(PetPeeves) as petPeevesCount,
                ROUND(
                    (COUNT(DreamJob) + COUNT(SuperPower) + COUNT(BiggestFear) + COUNT(HappiestMemory) + COUNT(PetPeeves)) 
                    / COUNT(DISTINCT UserID) * 100, 2
                ) as completionPercentage
            FROM PERSONALITY_TRAITS
        ");
        $aggregateReports['personalityAggregate'] = $stmt->fetch();
        
        // 4.Relationship Statistics (COUNT, HAVING clause, GROUP_CONCAT)
        $stmt = $pdo->query("
            SELECT 
                COUNT(DISTINCT UserID) as totalWithRelationships,
                COUNT(CASE WHEN RelationshipStatus = 'Single' THEN 1 END) as singleCount,
                COUNT(CASE WHEN RelationshipStatus = 'In a Relationship' THEN 1 END) as inRelationshipCount,
                COUNT(CASE WHEN RelationshipStatus = 'Married' THEN 1 END) as marriedCount,
                COUNT(CASE WHEN Crush IS NOT NULL THEN 1 END) as hasCrush,
                COUNT(CASE WHEN CelebrityCrush IS NOT NULL THEN 1 END) as hasCelebrityCrush,
                (SELECT COUNT(*) FROM RELATIONSHIPS WHERE BestFriend IS NOT NULL) as hasBestFriend,
                ROUND(
                    COUNT(CASE WHEN Crush IS NOT NULL THEN 1 END) / COUNT(DISTINCT UserID) * 100, 2
                ) as crushPercentage
            FROM RELATIONSHIPS
        ");
        $aggregateReports['relationshipAggregate'] = $stmt->fetch();
        
        // 5.Complete User Profile Summary (COUNT with CASE WHEN for completeness)
        $stmt = $pdo->query("
            SELECT 
                u.UserID,
                u.FullName,
                ROUND(
                    (
                        (CASE WHEN u.FullName IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN u.NickName IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN u.BDay IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN u.ContactNumber IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN u.EmailAdd IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FColor IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FFood IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FMovie IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FSeries IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FArtist IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FSong IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FBook IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FHobby IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FPlace IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN f.FSports IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN p.DreamJob IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN p.SuperPower IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN p.BiggestFear IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN r.BestFriend IS NOT NULL THEN 1 ELSE 0 END) +
                        (CASE WHEN r.Crush IS NOT NULL THEN 1 ELSE 0 END)
                    ) / 20 * 100, 2
                ) as profileCompletionPercentage,
                COUNT(DISTINCT f.UserID) as hasFavorites,
                COUNT(DISTINCT p.UserID) as hasTraits,
                COUNT(DISTINCT r.UserID) as hasRelationships
            FROM USERS u
            LEFT JOIN FAVORITES f ON u.UserID = f.UserID
            LEFT JOIN PERSONALITY_TRAITS p ON u.UserID = p.UserID
            LEFT JOIN RELATIONSHIPS r ON u.UserID = r.UserID
            GROUP BY u.UserID, u.FullName
            ORDER BY profileCompletionPercentage DESC
            LIMIT 10
        ");
        $aggregateReports['profileCompletion'] = $stmt->fetchAll();
        
        return $aggregateReports;
    } catch(PDOException $e) {
        throw new Exception('Error in aggregate reports: ' . $e->getMessage());
    }
}

// ===== MAIN REPORTS FUNCTION =====
function generateReports($pdo) {
    try {
        $allReports = [];
        
        // Get basic reports
        $allReports['basicReports'] = getBasicReports($pdo);
        
        // Get aggregate reports
        $allReports['aggregateReports'] = getAggregateReports($pdo);
        
        echo json_encode([
            'success' => true,
            'reports' => $allReports,
            'timestamp' => date('Y-m-d H:i:s'),
            'totalSections' => 10
        ]);
        
    } catch(Exception $e) {
        echo json_encode([
            'success' => false,
            'message' => $e->getMessage()
        ]);
    }
}
?>