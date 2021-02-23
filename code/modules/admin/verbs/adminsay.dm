/client/proc/cmd_admin_say(msg as text)
	set category = "Special Verbs"
	set name = "Asay" //Gave this shit a shorter name so you only have to time out "asay" rather than "admin say" to use it --NeoFite
	set hidden = 1
	if(!check_rights(0))
		return

	msg = copytext_char(sanitize(msg), 1, MAX_MESSAGE_LEN)
	if(!msg)
		return
	msg = emoji_parse(msg)
	mob.log_talk(msg, LOG_ASAY)

	msg = keywords_lookup(msg)
	msg = "<span class='adminsay'><span class='prefix'>ADMIN:</span> <EM>[key_name(usr, 1)]</EM> [ADMIN_FLW(mob)]: <span class='message linkify'>[msg]</span></span>"
	to_chat(GLOB.admins, msg)
	SEND_SOUND(GLOB.admins, sound('sound/effects/asay.ogg'))
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Asay") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/get_admin_say()
	var/msg = input(src, null, "asay \"text\"") as text
	cmd_admin_say(msg)
