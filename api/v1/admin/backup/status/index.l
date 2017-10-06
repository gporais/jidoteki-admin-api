# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2015-2017 Alexander Williams, Unscramble <license@unscramble.jp>

(de status-exists ()
  (info (pack *Upload_path "backup.json")) )

[de status-get ()
  (if (status-exists)
      (response-json-nocache (pack *Upload_path "backup.json") 200 T)
      (http-msg 404) ]

(de status-request ()
  (check-auth-request "GET")
  (status-get) )

(status-request)