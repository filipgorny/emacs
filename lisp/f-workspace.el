(defvar f-workspace/projects (list ()))

(defun f-workspace/create-project (name folder)
    (interactive)
    (setq project-table (make-hash-table :test 'equal))
    (puthash "name" name project-table)
    (puthash "folder" folder project-table)
    project-table)

(defun f-workspace/persist-projects (id, hash)
    )

(f-workspace/test-create-project)
