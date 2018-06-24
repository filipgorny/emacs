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
    public function foo(array $argument)
    {
        $task = new Task();
        $task->test
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

