<?php

namespace PhpBrowser\Commands;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Input\InputArgument;
use PhpBrowser\PhpBrowser;

class FindClass extends Command
{
    protected function configure()
    {
        $this
            ->setName('browser:find-class')
            ->addArgument('path', InputArgument::REQUIRED, 'Current lookup path.')
            ->addArgument('class', InputArgument::REQUIRED, 'class')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $phpBrowser = PhpBrowser::getInstance();

        $files = $phpBrowser->findClass($input->getArgument('path'), $input->getArgument("class"));

        foreach ($files as $class => $file) {
            $output->writeln($class.':'.$file);
        }
    }
}

