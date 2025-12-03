#!/bin/bash
# Small script to test all docker-compose file for syntax errors, display images and ports


echo "🔍 Testing all docker-compose files..."
echo ""

for file in *-docker-compose.yml; do
    echo "-----------------------------------"
    echo "Testing: $file"
    echo "-----------------------------------"
    
    if docker-compose -f "$file" --env-file env-exemple config > /dev/null 2>&1; then
        echo "✅ Syntax OK"
        
        echo ""
        echo "🐋 Image:"
        docker-compose -f "$file" --env-file env-exemple config | grep "image:" | sed 's/^[ \t]*//'
        
        echo ""
        echo "Ports:"
        docker-compose -f "$file" --env-file env-exemple config | grep -A3 "ports:" | grep -E "published|target" | sed 's/^[ \t]*//'
        
        echo ""
    else
        echo "❌ ERROR in $file"
        docker-compose -f "$file" --env-file env-exemple config
        echo ""
    fi
done

    echo "-----------------------------------"