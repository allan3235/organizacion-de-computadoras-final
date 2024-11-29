struct CURP {
std::string curp;
};

Acceso y Manipulación de Fecha

Fecha hoy = {7, 11, 2024};
std::cout << "Fecha: " << hoy.dia << "/" << hoy.mes << "/" << hoy.anio << std::endl;

Acceso y Manipulación de Correo Electrónico
CorreoElectronico email = {"usuario", "dominio.com"};
std::cout << "Correo: " << email.usuario << "@" << email.dominio << std::endl;