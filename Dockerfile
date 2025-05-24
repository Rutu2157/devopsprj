# Use official Nginx image
FROM nginx:alpine

# Copy static website to default Nginx directory
COPY student-admission-site/ /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
