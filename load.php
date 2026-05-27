<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$file = __DIR__ . '/data.json';

if (!file_exists($file)) {
    echo json_encode(['html' => '']);
    exit;
}

$content = file_get_contents($file);
$data = json_decode($content, true);

if (!$data || !isset($data['html'])) {
    echo json_encode(['html' => '']);
    exit;
}

echo json_encode(['html' => $data['html']]);