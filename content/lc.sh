lowercase_files() {
    local file
    local lowercase_name
    local temp_name
    local count=0
    
    # Loop through all files in current directory (not subdirectories)
    for file in *; do
        # Skip if no files match (when * doesn't expand)
        [ -e "$file" ] || continue
        
        # Skip directories
        [ -f "$file" ] || continue
        
        # Convert filename to lowercase
        lowercase_name=$(echo "$file" | tr '[:upper:]' '[:lower:]')
        
        # Only rename if the name actually changes
        if [ "$file" != "$lowercase_name" ]; then
            # Use a temporary name to avoid case-insensitive filesystem issues
            temp_name="${file}.tmp$$"
            
            mv "$file" "$temp_name" && mv "$temp_name" "$lowercase_name"
            
            if [ $? -eq 0 ]; then
                echo "Renamed: $file → $lowercase_name"
                ((count++))
            else
                echo "Error: Failed to rename '$file'"
                # Try to restore original name if second rename failed
                [ -e "$temp_name" ] && mv "$temp_name" "$file"
            fi
        fi
    done
    
    echo "Renamed $count file(s)"
}