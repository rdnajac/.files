Vim�UnDo� !j�SK5%��� �Ae��_0\Uf��G���^�                                      e�t�    _�                             ����                                                                                                                                                                                                                                                                                                                            
                     v        e��     �                   �               
   local M = {     "LunarVim/breadcrumbs.nvim",   6  commit = "1033b354f65206793831207d5c9047fc059e35c3",   }       function M.config()      require("breadcrumbs").setup()   end       return M5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        e��    �                ---5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  v        e�t�    �                  �                 <-- Configuration for the `LunarVim/breadcrumbs.nvim` plugin.   -- @module breadcrumbs   local M = {   (  --- The name of the plugin repository.     -- @string     "LunarVim/breadcrumbs.nvim",       4  --- The specific commit hash of the plugin to use.     -- @string   6  commit = "1033b354f65206793831207d5c9047fc059e35c3",   }       ---   E-- Configures the behavior of the `LunarVim/breadcrumbs.nvim` plugin.   -- @function config   function M.config()   &  --- Set up the `breadcrumbs` plugin.      require("breadcrumbs").setup()   end       return M    5��