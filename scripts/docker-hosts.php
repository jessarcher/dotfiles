#!/usr/bin/env php
<?php

// Delete existing entries

`sed -i '/# docker-hosts.php$/d' /etc/hosts`;

// Add entries

exec("docker ps -q", $ids);

foreach ($ids as $id) {
    $inspect = json_decode(`docker inspect $id`);
    $name = substr($inspect[0]->Name, 1);
    $ips = [];
    foreach ((array) $inspect[0]->NetworkSettings->Networks as $network) {
        $ip = $network->IPAddress;
        echo "Adding entry for $name to $ip\n";
        `echo "$ip $name # docker-hosts.php" >> /etc/hosts`;
    }
}
