
#include <File.au3>
#include <Array.au3>

ConsoleWrite(@CRLF)

_Example()
Func _Example()
	Local $sFileDir = "C:\EPLAN4\P\MBE\FIOLA2010\FIO80622.P\"
	Local $sFilePath = $sFileDir & "KLEMMEN.DAT"
	_ReadResourcesMark($sFilePath)

	$sFilePath = $sFileDir & "STKL.DAT"
	_ReadResourcesMark($sFilePath)

	$sFilePath = $sFileDir & "STKL.IDX"
	_ReadResourcesMark($sFilePath)

	$sFilePath = $sFileDir & "STKLEPL.ASC"
	_ReadResourcesMark($sFilePath)

	$sFilePath = $sFileDir & "STUECK.ASC"
	_ReadResourcesMark($sFilePath)
EndFunc

Func _ReadResourcesMark($sFilePath)
	If StringInStr(FileGetAttrib($sFilePath), "R") Then Return SetError(1, 0, -1)

	; Open the file for reading.
;~ 	Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
;~ 	Local $hFileOpen = FileOpen($sFilePath, $FO_READ + $FO_ANSI)
	Local $hFileOpen = FileOpen($sFilePath, $FO_READ + $FO_BINARY)
	If $hFileOpen = -1 Then Return SetError(2, 0, -1)

	; Read the contents of the file and stores in a variable
	Local $sFileRead = FileRead($hFileOpen)
	Local $iExtended = @extended
	FileClose($hFileOpen) ; Close the open file after reading

	$sFileRead = BinaryToString($sFileRead, $SB_ANSI)

	Local $aSPlit = StringSplit($sFileRead, "-",  $STR_ENTIRESPLIT)
	_ArrayDisplay($aSPlit)


	ConsoleWrite($iExtended & @CRLF)
	ConsoleWrite($sFileRead & @CRLF)

;~ 	MsgBox(0, "", $sFileRead)

	; Set the default parameters
;~ 	If $iCaseSensitive = Default Then $iCaseSensitive = 0
;~ 	If $iOccurance = Default Then $iOccurance = 1

	; Replace strings
;~ 	$sFileRead = StringReplace($sFileRead, $sSearchString, $sReplaceString, 1 - $iOccurance, $iCaseSensitive)
;~ 	Local $iReturn = @extended

	; If there are replacements then overwrite the file
;~ 	If $iReturn Then
		; Retrieve the file encoding
;~ 		Local $iFileEncoding = FileGetEncoding($sFilePath)

		; Open the file for writing and set the overwrite flag
;~ 		$hFileOpen = FileOpen($sFilePath, $iFileEncoding + $FO_OVERWRITE)
;~ 		If $hFileOpen = -1 Then Return SetError(3, 0, -1)

		; Write to the open file
;~ 		FileWrite($hFileOpen, $sFileRead)
;~ 		FileClose($hFileOpen) ; Close the open file after writing
;~ 	EndIf
;~ 	Return $iReturn
EndFunc   ;==>_ReadResourcesMark
