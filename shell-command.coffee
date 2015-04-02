# Description: An update to the simple shell commands script Sapan Ganguly created.
# While the script worked well for me in shell it caused problems with the Slack Adapter.
# With the help of Evan Soloman, this version plays nice with Slack.
#
# Dependencies:
# None
#
# Configuration
# Change the script if you have to execute a different command.
# The command variable can be changed to basic shell commands or you can execute
# scripts, as in the example here.
#
# Commands:
#  hubot script
#
# Authors:
# Eric Z Goodnight, with LOTS of help from Evan Soloman & Sapan Ganguly
#

{exec} = require 'child_process'
module.exports = (robot) ->
  robot.respond /script (.*)$/i, (msg) ->
    Argument = msg.match[1]
    command = "/home/user/script.sh #{Argument}"

    msg.send "This is the command #{command}."

    exec command, (error, stdout, stderr) ->
      msg.send error if error
      msg.send stdout if stdout
      msg.send stderr if stderr
