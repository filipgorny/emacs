<?php

namespace Filip\Dto;

use Filip\Service\TaskService;
use Ddd\Login;
use BUrak\Burak;

class Task
{
    private $t;

    public function test($dd, array $p, Login $login, Burak $burak)
    {
        $s = new \DateTime();
        $taskService = new TaskService();
        $taskServive->foo();
    }
}

