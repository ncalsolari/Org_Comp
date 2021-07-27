$lAllowedFileExtensions = array("gif", "jpeg", "jpg", "png");
$lAllowedFileTypes = array("image/gif", "image/jpeg", "image/jpg", "image/pjpeg", "image/x-png", "image/png");
$lFilenameParts = explode(".", $lFilename);
$lFileExtension = end($lFilenameParts);
$lValidationMessage = "Validation not performed";
$lFileMovedMessage = "Moving file was not attempted";


$lValidationMessage = "Validation performed.";
				
if (!in_array($lFileExtension, $lAllowedFileExtensions)) {
	$lValidationMessage .= " File extension {$lFileExtension} not allowed.";
	$lFileValid = FALSE;
}

if (!in_array($lFileType, $lAllowedFileTypes)) {
	$lValidationMessage .= " File type {$lFileType} not allowed.";
	$lFileValid = FALSE;
}

if ($lFileSize > $lAllowedFileSize){
	$lValidationMessage .= "File size {$lFileSizeString} exceeds allowed file size {$lAllowedFileSizeString}.";
	$lFileValid = FALSE;
}



$lAllowedFileSize = 20000;

if ($lFileSize > $lAllowedFileSize){
	$lValidationMessage .= "File size {$lFileSizeString} exceeds allowed file size {$lAllowedFileSizeString}.";
	$lFileValid = FALSE;
}
