/* insert into the devices table two devices, an 'accelerometer' and a 'gyroscope'.
also add 11 parts to the parts table.  The parts should all be numbers between 1 and 10000.
3 parts should be associated with the accelerometer, 5 parts should be associated with the gyroscope,
and the remaining 3 should not be associated with a device. */
INSERT INTO devices
       (name)
VALUES ('accelerometer'),
       ('gyroscope');

INSERT INTO parts
       (part_number, device_id)
VALUES (101, 1),
       (102, 1),
       (103, 1),
       (201, 2),
       (202, 2),
       (203, 2),
       (204, 2),
       (205, 2),
       (301, NULL),
       (302, NULL),
       (303, NULL);
