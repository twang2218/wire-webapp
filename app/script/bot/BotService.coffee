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

window.z ?= {}
z.bot ?= {}

BOT_SERVICE_URL = 'api/v1/bot/'

class z.bot.BotService
  constructor: ->
    @logger = new z.util.Logger 'z.bot.BotService', z.config.LOGGER.OPTIONS
    @url = "#{z.util.Environment.backend.website_url()}#{BOT_SERVICE_URL}"
    return @

  fetch_bot: (bot_name) ->
    return new Promise (resolve) =>
      $.get "#{@url}#{bot_name}/"
      .done (data, textStatus, jqXHR) ->
        resolve data.result
      .fail (jqXHR, textStatus, errorThrown) =>
        @logger.warn "Could not find information for bot '#{bot_name}': #{errorThrown}"
