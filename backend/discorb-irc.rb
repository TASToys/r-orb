#!/usr/bin/env ruby

#adding requires

require 'discordrb'
require 'configatron'
require_relative 'config.rb'
require 'open-uri'
require 'twitch-api'

#make a pipe and use it

system( 'makefifo botpipe' )
outpipe = open("botpipe", "w+")
$is_running = nil

client =  Twitch::Client.new client_id: 

bot = Discordrb::Commands::CommandBot.new token: configatron.token, prefix: '>', should_parse_self: 'on'

bot.command(:hello) do |event|
	event << "Hello " + event.user.mention + " how can I help you?"
end

bot.command(:focus) do |event|
	event << event.user.mention + " you really should focus."
end

bot.command(:streamed) do |event|
	event << client.get_users({login: "mediamagnet"})
end


=begin
if tchannel.streaming? == true
	bot.message(in: configatron.channel) do |event|
		event << "Hey @everyone " + "#{tchannel.display_name}" + "Just went live! Watch them at " + "#{stream.url}"
	end
end
=end

bot.run :async

loop do

	bot.game=configatron.botgame
	sleep(40)
	bot.run.sync	
end

