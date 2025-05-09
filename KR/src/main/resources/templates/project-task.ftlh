<#import "/spring.ftl" as spring>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>${project.projectName} - Задачи</title>
    <link rel="stylesheet" href="../static/style.css">
</head>
<body>
<h1>${project.projectName}</h1>
<p>${project.description!''}</p>

<div>
    <div>
        <h2>To Do</h2>
        <#list tasks as tas>
            <#if tas.status == 'TODO'>
                <h3>${tas.title}</h3>
                <h4><#if tas.description??>${tas.description}<#else>Нет описания</#if></h4>

                <h4><#if tas.deadline??>${tas.deadline}<#else>Неограничено</#if></h4>

                <form action="/tasks/${tas.taskId}/status" method="post">
                    <input type="hidden" name="projectId" value="${project.projectId}">
                    <label>
                        <select name="status" onchange="this.form.submit()">
                            <#list TaskStatusValues as st>
                                <option value="${st}" ${(st == tas.status)?then('selected', '')}>
                                    ${st}
                                </option>
                            </#list>
                        </select>
                    </label>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
                <form action="/tasks/${tas.taskId}/delete" method="post">
                    <input type="hidden" name="projectId" value="${project.projectId}">
                    <input type="submit" value="Удалить"/>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </#if>
        </#list>
    </div>

    <div>
        <h2>Doing</h2>
        <#list tasks as tas>
            <#if tas.status == 'DOING'>
                <h3>${tas.title}</h3>
                <h4><#if tas.description??>${tas.description}<#else>Нет описания</#if></h4>

                <h4><#if tas.deadline??>${tas.deadline}<#else>Неограничено</#if></h4>
                <form action="/tasks/${tas.taskId}/status" method="post">
                    <input type="hidden" name="projectId" value="${project.projectId}">
                    <label>
                        <select name="status" onchange="this.form.submit()">
                            <#list TaskStatusValues as st>
                                <option value="${st}" ${(st == tas.status)?then('selected', '')}>
                                    ${st}
                                </option>
                            </#list>
                        </select>
                    </label>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
                <form action="/tasks/${tas.taskId}/delete" method="post">
                    <input type="hidden" name="projectId" value="${project.projectId}">
                    <input type="submit" value="Удалить"/>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </#if>
        </#list>
    </div>
    <div>
        <h2>Done</h2>
        <#list tasks as tas>
                <#if tas.status == 'DONE'>
                    <h3>${tas.title}</h3>
                    <h4><#if tas.description??>${tas.description}<#else>Нет описания</#if></h4>

                    <h4><#if tas.deadline??>${tas.deadline}<#else>Неограничено</#if></h4>
                    <form action="/tasks/${tas.taskId}/status" method="post">
                        <input type="hidden" name="projectId" value="${project.projectId}">
                        <label>
                            <select name="status" onchange="this.form.submit()">
                                <#list TaskStatusValues as st>
                                    <option value="${st}" ${(st == tas.status)?then('selected', '')}>
                                        ${st}
                                    </option>
                                </#list>
                            </select>
                        </label>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form>
                    <form action="/tasks/${tas.taskId}/delete" method="post">
                        <input type="hidden" name="projectId" value="${project.projectId}">
                        <input type="submit" value="Удалить"/>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form>
                </#if>
        </#list>
    </div>
</div>

    <a href="/projects/${project.projectId}/addTask">Создать задачу</a>

<#--    <h2>Добавить участника</h2>-->
<#--        <form action="/projects/${project.projectId}/members" method="post">-->
<#--            <div>-->
<#--                <label>Email или логин пользователя:</label>-->
<#--                <label>-->
<#--                    <input type="text" name="username" required> <!-- Измените name на username, как в контроллере &ndash;&gt;-->
<#--                </label>-->
<#--            </div>-->
<#--            <div>-->
<#--                <label>Роль:</label>-->
<#--                <label>-->
<#--                    <select name="role" class="form-control" required>-->
<#--                        <#list ProjectRoleValues as role>-->
<#--                            <option value="${role}">${role.getDisplayName()}</option>-->
<#--                        </#list>-->
<#--                    </select>-->
<#--                </label>-->
<#--            </div>-->
<#--            <div>-->
<#--                <button type="submit">Добавить</button>-->
<#--            </div>-->
<#--            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">-->
<#--        </form>-->

</body>
</html>