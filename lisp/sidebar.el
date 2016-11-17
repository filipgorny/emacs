(require-package 'project-explorer)
(project-explorer-open)
(setq window-divider-first-pixel 0)
(set-display-table-slot standard-display-table
                        'vertical-border (make-glyph-code 8203))
