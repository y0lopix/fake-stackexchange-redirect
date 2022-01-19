const currentLocation = window.location;

let questionId;
let hostname;

let hostParts = currentLocation.host.split(".");
let pathParts = currentLocation.pathname.split("/");

// If the current page is a question page on QAStack
if ( hostParts[0] === "qastack" && hostParts.length === 2 && pathParts.length > 3 ) {
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
else
	console.log("not redirecting")
