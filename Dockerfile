# Usar a versão do PHP com Apache embutido
FROM php:apache

# Atualizar o sistema
RUN apt-get update

# Instalar Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs

# Exibir versões para conferência
RUN php -v && node -v && apache2 -v

# Definir diretório de trabalho
WORKDIR /var/www/html

# Copiar arquivos do projeto
COPY src /var/www/html

# Expor a porta do Apache
EXPOSE 80

# Adicionar a diretiva ServerName
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Iniciar o Apache no modo foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
