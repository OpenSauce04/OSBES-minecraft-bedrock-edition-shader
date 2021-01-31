
#include "../uniformShaderConstants"

vec4 calculateSkyLight(vec3 normalVector, float isRain, float isDay, float isHell){
	vec3 skyLightDirection  = vec3(0.0,1.0,0.0);
	float skyLightWrapping = 8.0;
	float skyDot = max((dot(skyLightDirection, normalVector) + skyLightWrapping)/(1.0 + skyLightWrapping),0.0);
	
	vec3 rainSkyLightColor = vec3(0.4, 0.4, 0.4) * isRain * isDay;
	vec3 clearSkyLightColor = pow(FOG_COLOR.rgb, vec3(0.6)) * (1.0 - isRain); 
	
	if(isHell > 0.9){
		clearSkyLightColor = vec3(0.0);
		rainSkyLightColor = vec3(0.0);
	}
	
	return vec4(rainSkyLightColor + clearSkyLightColor, skyDot);
}