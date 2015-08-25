/datum/unlockable
	var/id = "" // Used in prerequisites.
	var/name=""
	var/desc=""
	var/cost=0 // Cost to unlock
	var/time=0 // Time to unlock
	var/unlocked=1
	//var/remove_on_detach=1

	var/list/prerequisites=list()
	var/datum/research_tree/tree

// CALL BEFORE USING ANY OTHER PROCS.
/datum/unlockable/proc/set_context(var/datum/research_tree/T)
	tree = T

/datum/unlockable/proc/check_prerequisites()
	for(var/prereq in prerequisites)
		if(!(prereq in tree.unlocked))
			return 0
	return 1

// INTERNAL: Begin unlocking process.
/datum/unlockable/proc/unlock()
	if(tree.unlocking)
		return 0
	return 1


/datum/unlockable/proc/toTableRow(var/datum/research_tree/tree, var/mob/user)
	return "<tr><th><a href=\"?src=\ref[tree];user=\ref[user];unlock=[id]\">[name]</a></th><td>[desc]</td></tr>"

/**
 * additional checks to perform when unlocking things.
 * @returns Can unlock
 */
/datum/unlockable/proc/unlock_check()
	return 0

/**
 * What to do when unlocked.
 */
/datum/unlockable/proc/unlock_action()
	return

/**
 * How to remove the unlockable (such as when detached)
 */
/datum/unlockable/proc/remove_action()
	return

/datum/unlockable/proc/can_buy()
	return unlock_check() && !tree.unlocking