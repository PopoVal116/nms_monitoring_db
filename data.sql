-- Локации 
INSERT INTO locations (name, city, address) VALUES
('ЦОД Новосибирск', 'Новосибирск', 'ул. Инженерная, 15'),
('Узел связи №1', 'Новосибирск', 'ул. Красный проспект, 87'),
('ЦОД Москва', 'Москва', 'ул. Большая Ордынка, 42'),
('Узел связи Бердск', 'Бердск', 'промзона, корпус 3'),
('Офис СибГУТИ', 'Новосибирск', 'ул. Кирова, 86'),
('Узел связи Академгородок', 'Новосибирск', 'ул. Лаврентьева, 12'),
('ЦОД Екатеринбург', 'Екатеринбург', 'ул. Малышева, 145'),
('Узел связи Томск', 'Томск', 'ул. Вершинина, 74'),
('Технический узел Кольцово', 'Новосибирск', 'аэропорт Кольцово');

-- Типы устройств 
INSERT INTO device_types (name) VALUES
('Router'), ('Switch'), ('Firewall'), ('Base Station'),
('Server'), ('ONT'), ('Access Point'), ('Router Core'),
('Switch L3'), ('Optical Transport');

-- Производители 
INSERT INTO vendors (name) VALUES
('Cisco'), ('Huawei'), ('Juniper'), ('MikroTik'),
('Ericsson'), ('TP-Link'), ('Nokia'), ('ZTE'),
('Dell'), ('Arista');

-- Устройства
INSERT INTO devices (hostname, ip_address, location_id, device_type_id, vendor_id, status, last_seen) VALUES
('router-nsk-01', '192.168.10.1', 1, 1, 1, 'active', NOW() - INTERVAL '5 minutes'),
('switch-nsk-01', '192.168.10.10', 1, 2, 1, 'active', NOW() - INTERVAL '12 minutes'),
('fw-nsk-01', '192.168.10.5', 1, 3, 2, 'active', NOW() - INTERVAL '1 hour'),
('bs-berdsk-01', '192.168.20.1', 4, 4, 5, 'active', NOW() - INTERVAL '30 minutes'),
('router-msk-01', '10.10.10.1', 3, 1, 1, 'maintenance', NOW() - INTERVAL '2 hours'),
('switch-nsk-02', '192.168.10.11', 2, 2, 4, 'active', NOW() - INTERVAL '3 minutes'),
('server-nsk-01', '192.168.30.50', 5, 5, 1, 'active', NOW() - INTERVAL '10 minutes'),
('fw-nsk-02', '192.168.10.6', 1, 3, 2, 'fault', NOW() - INTERVAL '45 minutes'),
('router-nsk-02', '192.168.11.1', 1, 1, 1, 'active', NOW() - INTERVAL '8 minutes'),
('ap-nsk-01', '192.168.10.101', 1, 7, 7, 'active', NOW() - INTERVAL '20 minutes'),
('core-sw-01', '192.168.5.1', 2, 8, 1, 'active', NOW() - INTERVAL '5 minutes'),
('bs-nsk-02', '192.168.20.2', 4, 4, 5, 'active', NOW() - INTERVAL '1 hour'),
('router-ekb-01', '10.20.30.1', 7, 1, 2, 'active', NOW() - INTERVAL '15 minutes'),
('fw-nsk-03', '192.168.10.7', 1, 3, 2, 'inactive', NOW() - INTERVAL '4 hours'),
('switch-berdsk-02', '192.168.21.10', 4, 2, 4, 'active', NOW() - INTERVAL '25 minutes'),
('server-db-01', '192.168.30.51', 5, 5, 7, 'active', NOW() - INTERVAL '10 minutes'),
('router-tmsk-01', '192.168.40.1', 8, 1, 1, 'fault', NOW() - INTERVAL '2 hours'),
('ap-nsk-02', '192.168.10.102', 2, 7, 7, 'active', NOW() - INTERVAL '40 minutes');

-- Сетевые интерфейсы
INSERT INTO network_interfaces (device_id, interface_name, status) VALUES
(1, 'eth0', 'up'), (1, 'eth1', 'up'),
(2, 'Gi0/1', 'up'), (2, 'Gi0/2', 'down'),
(3, 'WAN', 'up'),
(4, 'port1', 'up'),
(5, 'GigabitEthernet0/0', 'up'),
(8, 'eth0', 'down'),
(9, 'eth0', 'up'), (9, 'eth1', 'up'),
(10, 'wlan0', 'up'),
(11, 'Gi0/0', 'up'), (11, 'Gi0/1', 'up'), (11, 'Gi0/2', 'down'),
(12, 'port0', 'up'),
(13, 'WAN', 'up');

-- Метрики мониторинга
INSERT INTO metrics (device_id, metric_type, value, collected_at) VALUES
(1, 'cpu_usage', 45.6, NOW() - INTERVAL '10 minutes'),
(1, 'memory_percent', 67.8, NOW() - INTERVAL '10 minutes'),
(1, 'traffic_in_mbps', 1240.5, NOW() - INTERVAL '10 minutes'),
(2, 'cpu_usage', 23.4, NOW() - INTERVAL '15 minutes'),
(2, 'traffic_out_mbps', 875.3, NOW() - INTERVAL '15 minutes'),
(3, 'cpu_usage', 92.1, NOW() - INTERVAL '5 minutes'),
(4, 'cpu_usage', 78.5, NOW() - INTERVAL '20 minutes'),
(8, 'cpu_usage', 98.7, NOW() - INTERVAL '30 minutes'),
(1, 'temperature', 48.3, NOW() - INTERVAL '25 minutes'),
(9, 'cpu_usage', 67.4, NOW() - INTERVAL '30 minutes'),
(10, 'cpu_usage', 88.7, NOW() - INTERVAL '5 minutes'),
(11, 'traffic_out_mbps', 1540.2, NOW() - INTERVAL '35 minutes'),
(3, 'memory_percent', 82.1, NOW() - INTERVAL '40 minutes'),
(5, 'cpu_usage', 15.2, NOW() - INTERVAL '1 hour');

-- Инциденты
INSERT INTO incidents (device_id, title, severity, status, created_at, resolved_at) VALUES
(3, 'Критическая загрузка CPU на Firewall', 'critical', 'open', NOW() - INTERVAL '2 hours', NULL),
(8, 'Интерфейс eth0 упал', 'high', 'resolved', NOW() - INTERVAL '5 hours', NOW() - INTERVAL '1 hour'),
(5, 'Плановое обслуживание роутера', 'medium', 'resolved', NOW() - INTERVAL '1 day', NOW() - INTERVAL '3 hours'),
(1, 'Высокий входящий трафик', 'medium', 'open', NOW() - INTERVAL '45 minutes', NULL),
(2, 'Порт Gi0/2 не отвечает', 'low', 'open', NOW() - INTERVAL '3 hours', NULL),
(4, 'Высокая загрузка CPU на Base Station', 'high', 'open', NOW() - INTERVAL '1 hour', NULL),
(9, 'Потеря соединения с router-nsk-02', 'critical', 'open', NOW() - INTERVAL '45 minutes', NULL),
(11, 'Перегрузка портов на core-sw-01', 'medium', 'open', NOW() - INTERVAL '2 hours', NULL);

-- Проверка итогового количества записей
SELECT 'locations' as table_name, COUNT(*) as row_count FROM locations UNION ALL
SELECT 'device_types', COUNT(*) FROM device_types UNION ALL
SELECT 'vendors', COUNT(*) FROM vendors UNION ALL
SELECT 'devices', COUNT(*) FROM devices UNION ALL
SELECT 'network_interfaces', COUNT(*) FROM network_interfaces UNION ALL
SELECT 'metrics', COUNT(*) FROM metrics UNION ALL
SELECT 'incidents', COUNT(*) FROM incidents
ORDER BY row_count DESC;

