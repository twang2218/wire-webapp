#
# Wire
# Copyright (C) 2016 Wire Swiss GmbH
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see http://www.gnu.org/licenses/.
#

describe 'Shortcut', ->

  map = z.ui.Shortcut.shortcut_map

  describe 'get_shortcut', ->

    describe 'webapp', ->

      beforeEach ->
        z.util.Environment.electron = false

      it 'can get shortcut for mac', ->
        z.util.Environment.os.mac = true
        mac_shortcut = z.ui.Shortcut.get_shortcut z.ui.ShortcutType.ADD_PEOPLE
        expect(mac_shortcut).toBe map[z.ui.ShortcutType.ADD_PEOPLE].shortcut.webapp.macos

      it 'can get shortcut for pc', ->
        z.util.Environment.os.mac = false
        pc_shortcut = z.ui.Shortcut.get_shortcut z.ui.ShortcutType.ADD_PEOPLE
        expect(pc_shortcut).toBe map[z.ui.ShortcutType.ADD_PEOPLE].shortcut.webapp.pc

    describe 'electron', ->

      beforeEach ->
        z.util.Environment.electron = true

      it 'can get shortcut for electron mac', ->
        z.util.Environment.os.mac = true
        mac_shortcut = z.ui.Shortcut.get_shortcut z.ui.ShortcutType.ADD_PEOPLE
        expect(mac_shortcut).toBe map[z.ui.ShortcutType.ADD_PEOPLE].shortcut.electron.macos

      it 'can get shortcut for electron pc', ->
        z.util.Environment.os.mac = false
        pc_shortcut = z.ui.Shortcut.get_shortcut z.ui.ShortcutType.ADD_PEOPLE
        expect(pc_shortcut).toBe map[z.ui.ShortcutType.ADD_PEOPLE].shortcut.electron.pc

  describe 'get_shortcut_tooltip', ->

    describe 'webapp', ->

      beforeEach ->
        z.util.Environment.electron = false

      it 'can create a beautified tooltip for webapp mac', ->
        z.util.Environment.os.mac = true
        mac_shortcut = z.ui.Shortcut.get_shortcut_tooltip z.ui.ShortcutType.ADD_PEOPLE
        expect(mac_shortcut).toBe '⌘⇧K'

      it 'can create a beautified tooltip for webapp pc', ->
        z.util.Environment.os.mac = false
        pc_shortcut = z.ui.Shortcut.get_shortcut_tooltip z.ui.ShortcutType.ADD_PEOPLE
        expect(pc_shortcut).toBe 'Ctrl + Shift + K'

    describe 'electron', ->

      beforeEach ->
        z.util.Environment.electron = true

      it 'can create a beautified tooltip for webapp mac', ->
        z.util.Environment.os.mac = true
        mac_shortcut = z.ui.Shortcut.get_shortcut_tooltip z.ui.ShortcutType.ADD_PEOPLE
        expect(mac_shortcut).toBe '⌘⇧K'

      it 'can create a beautified tooltip for webapp pc', ->
        z.util.Environment.os.mac = false
        pc_shortcut = z.ui.Shortcut.get_shortcut_tooltip z.ui.ShortcutType.ADD_PEOPLE
        expect(pc_shortcut).toBe 'Ctrl + Shift + K'

  describe 'get_beautified_shortcut_mac', ->

    it 'can create a beautified shortcut', ->
      mac_shortcut = z.ui.Shortcut.get_beautified_shortcut_mac 'command + q'
      expect(mac_shortcut).toBe '⌘Q'

  describe 'get_beautified_shortcut_pc', ->

    it 'can create a beautified shortcut', ->
      pc_shortcut = z.ui.Shortcut.get_beautified_shortcut_win 'alt + F4'
      expect(pc_shortcut).toBe 'Alt + F4'
