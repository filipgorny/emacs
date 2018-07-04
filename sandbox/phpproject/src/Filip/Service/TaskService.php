<?php

namespace Filip\Service;

use Filip\Dto\Task;

class TaskService
{
    /**
     * @param string
     */
    private $test;

    /**
     * @param array $argument
     */
    public function foo(array $argument, Task $task, Bar $bar)
    {
        $task;
        $task = new Task;
    }

    /**
     * getTest
     */
	public function getTest()
	{
		return $this->test;
	}

    /**
     * setTest
     *
     * @param mixed $test
     */
	public function setTest($test)
	{
		$this->test = $test;
	}
}

