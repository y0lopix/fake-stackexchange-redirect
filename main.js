const currentLocation = window.location;

let questionId;
let hostname;

let hostParts = currentLocation.host.split(".");
let pathParts = currentLocation.pathname.split("/");

// If the current page in this host matches the pattern /forumName/questionId/... 
if ( pathParts.length > 3 && !isNaN(pathParts[2]) ) {
	questionId = pathParts[2];

	hostname = ( function() {
		switch (pathParts[1]) {
			case "programming": return "stackoverflow.com";
			case "server": return "serverfault.com";
			case "software": return "softwareengineering.stackexchange.com";
			case "superuser": return "superuser.com";
			case "quantum": return "quantumcomputing.stackexchange.com";
			default: return pathParts[1]+".stackexchange.com";
		}
	} ) ();

}

if (questionId != null)
	window.location.replace("https://" + hostname + "/questions/" + questionId);
