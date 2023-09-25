#!/bin/sh

PROJECT_CONFIG_FILE="project_meta.xml"

find . -type f -name "$PROJECT_CONFIG_FILE" | while read f; do
 	project_name=$(grep -Po '<project name="\K.*?(?=")' $f)
	echo "Creating/Updating project $project_name"
	osc --config .oscrc meta prj -F "$f" "$project_name"
	echo ""
done

