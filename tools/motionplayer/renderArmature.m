function renderArmature(armatureNum)
global SCENE
arm = SCENE.armatures(armatureNum);
if(~arm.rendered)
    for obj = SCENE.armatures(armatureNum).bones
        renderObj = patch(...
            'vertices',obj.vertices,...
            'AmbientStrength',SCENE.options.ambientStrength,...
            'DiffuseStrength',SCENE.options.diffuseStrength,...
            'SpecularStrength',SCENE.options.specularStrength,...
            'faces',obj.faces,...
            'tag',obj.name,...
            'edgecolor','none', ... %obj.edgecolor,...
            'facecolor',obj.facecolor);
        % get start position of the label
        pos = obj.labelStream(1:3,1);
        % create label for the current bone; default is invisible
%         labelObj = text(pos(1),pos(2),pos(3),obj.name,'Visible','off');
        SCENE.armatures(armatureNum).bones(obj.id).objectHandle = renderObj;
%         SCENE.armatures(armatureNum).bones(obj.id).labelHandle = labelObj;
    end
    SCENE.armatures(armatureNum).rendered = true;
end
end