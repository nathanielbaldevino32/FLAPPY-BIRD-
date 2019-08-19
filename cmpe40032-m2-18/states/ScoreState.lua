--[[
    ScoreState Class

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local bronze = love.graphics.newImage('Bronze.png')
local silver = love.graphics.newImage('Silver.png')
local gold = love.graphics.newImage('Gold.png')

function ScoreState:init()
 
 self.x = 155
 self.y = 50

end
--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end    

function ScoreState:render()
    -- simply render the score to the middle of the screen
    if self.score<=1 then 
        do
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Oof! Keep playing!', 0, 64, VIRTUAL_WIDTH, 'center')

            love.graphics.setFont(mediumFont)
            love.graphics.printf('Score: ' .. tostring(self.score), 0, 135, VIRTUAL_WIDTH, 'center')

            love.graphics.setFont(smallFont)
            love.graphics.printf('Press Enter to Play Again!', 0, 180, VIRTUAL_WIDTH, 'center')
        end
    elseif self.score<5 then
        do
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Congratulations!', 0, 32, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('You got a bronze trophy!', 0, 64, VIRTUAL_WIDTH, 'center')

            
            love.graphics.draw(bronze, self.x, self.y)
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Score: ' .. tostring(self.score), 0, 185, VIRTUAL_WIDTH, 'center')

            love.graphics.setFont(smallFont)
            love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')
        end
    elseif self.score<7 then
        do
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Congratulations!', 0, 32, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('You got a silver trophy!', 0, 64, VIRTUAL_WIDTH, 'center')

            love.graphics.draw(silver, self.x, self.y)
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Score: ' .. tostring(self.score), 0, 185, VIRTUAL_WIDTH, 'center')

            love.graphics.setFont(smallFont)
            love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')
        end
    else 
        do
            love.graphics.setFont(flappyFont)
            love.graphics.printf('Congratulations!', 0, 32, VIRTUAL_WIDTH, 'center')
            love.graphics.printf('You got a gold trophy!', 0, 64, VIRTUAL_WIDTH, 'center')


            love.graphics.draw(gold, self.x, self.y)
            love.graphics.setFont(mediumFont)
            love.graphics.printf('Score: ' .. tostring(self.score), 0, 185, VIRTUAL_WIDTH, 'center')

            love.graphics.setFont(smallFont)
            love.graphics.printf('Press Enter to Play Again!', 0, 210, VIRTUAL_WIDTH, 'center')
        end
    end
end



