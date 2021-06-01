<?php
if(!function_exists('educationLevel')) {
    function educationLevel($key = null) {
        $educationLevels = [
            'D1', 'D2', 'D3', 'D4',
            'S1', 'S2', 'S3'
        ];
        if($key !== null && in_array($key, $educationLevels)) {
            return $key;
        }

        return $educationLevels;
    }
}

if(!function_exists('userLevel')) {
    function userLevel($level = null) {
        $userLevels = [
            'ACADEMIC_STAFF' => 'BAAK',
            'STUDENT' => 'Mahasiswa',
            'STUDY_PROGRAM_LEADER' => 'Kaprodi',
            'LECTURER' => 'Dosen'
        ];

        if($level !== null && key_exists($level, $userLevels)) {
            return $userLevels[$level];
        }

        return $userLevels;
    }
}

if(!function_exists('userBadge')) {
    function userBadge($level) {
        $badgeColor = [
            'ACADEMIC_STAFF' => 'success',
            'STUDENT' => 'info',
            'STUDY_PROGRAM_LEADER' => 'warning',
            'LECTURER' => 'primary'
        ];

        if($level !== null && key_exists($level, $badgeColor)) {
            $color = $badgeColor[$level];
            $userLevel = strtoupper(userLevel($level));
            return "<span class='badge badge-$color'>$userLevel</span>";
        }
    }
}

if(!function_exists('getLecturship')) {
    function getLecturship($key = null) {
        $posisitions = [
            'EXPERT_ASSISTANT' => 'Asisten Ahli',
            'LECTURER' => 'Lektor',
            'CHIEF_LECTURER' => 'Lektor Kepala',
            'PROFESSOR' =>  'Profesor'
        ];

        if($key !== null && key_exists($key, $posisitions)) {
            return $posisitions[$key];
        }

        return $posisitions;
    }
}

if(!function_exists('setFlashMessage')) {
    function setFlashMessage($type, $actionType, $dataType) {
        $messageText = "";
        $messageType = "";
        $messageStatus = ($type == 'success') ? " berhasil " : " gagal ";

        if (in_array($actionType, ['insert', 'add'])) {
            $messageType = " disimpan!";
        } else if (in_array($actionType, ['update', 'edit'])) {
            $messageType = " diperbarui!";
        } else if (in_array($actionType, ['delete', 'destroy', 'remove'])) {
            $messageType = " dihapus!";
        }

        $messageText = "Data " . $dataType . $messageStatus . $messageType;

        return [
            'type' => $type,
            'text' => $messageText,
        ];
    }
}
