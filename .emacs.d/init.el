(set-language-environment "Japanese")

;; load-path
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf" "public_repos")

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;; opening
(split-window-below)   ; 
(other-window 1)       
(shell)                ; 

(split-window-right)   ; 
(other-window 1)       ; 
(dired default-directory) ; 

(other-window 1)       ; 
