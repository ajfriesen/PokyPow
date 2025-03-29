# Use Cases

## Save Power

Have a server running for 24/7?
You could save 33% of your power bill by automatically turing it off and on over night for 8 hours.


<div>
    <h3>Power Cost Calculator</h3>
    <label for="wattage">Wattage (W):</label>
    <input type="number" id="wattage" value="60">

    <label for="price">Power Price ($ per kWh):</label>
    <input type="number" id="price" step="0.01" value="0.29">

    <h3>Results (per year):</h3>
    <p>Always On: <span id="costAlways">-</span> per year</p>
    <p>16h/day: <span id="cost16h">-</span> per year</p>
    <p>Savings: <span id="savings">-</span> per year</p>

    <canvas id="costChart"></canvas>
</div>

<script>
let chart;

function calculateCost() {
    let wattage = parseFloat(document.getElementById("wattage").value);
    let price = parseFloat(document.getElementById("price").value);

    if (isNaN(wattage) || isNaN(price)) {
        return;
    }

    let hoursAlways = 24 * 365;
    let hours16h = 16 * 365;

    let costAlways = (wattage * hoursAlways / 1000) * price;
    let cost16h = (wattage * hours16h / 1000) * price;
    let savings = costAlways - cost16h;

    document.getElementById("costAlways").textContent = `$${costAlways.toFixed(2)}`;
    document.getElementById("cost16h").textContent = `$${cost16h.toFixed(2)}`;
    document.getElementById("savings").textContent = `$${savings.toFixed(2)}`;

    updateChart(costAlways, cost16h, savings);
}

function updateChart(costAlways, cost16h, savings) {
    let ctx = document.getElementById('costChart').getContext('2d');

    if (chart) {
        chart.destroy();
    }

    chart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Always On', '16h/day', 'Savings'],
            datasets: [{
                label: 'Cost ($) per Year',
                data: [costAlways, cost16h, savings],
                backgroundColor: ['#ff4c4c', '#4c9aff', '#4caf50'],
                borderColor: ['#b22222', '#005bbb', '#1b5e20'],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

// Auto-update on input change
document.getElementById("wattage").addEventListener("input", calculateCost);
document.getElementById("price").addEventListener("input", calculateCost);

// Run calculation on page load
window.onload = calculateCost;
</script>


## Control a PC that is hard to reach

Have a PC in the basement or just high up in a cupboard?
You can now power it on via a button, voice, on time.
The choice is yours with Home Assistant.

## Parental Control

Monitor uptime and check that your kids or you ;) are not overdoing game time!

## Automate your AI, Streaming, etc PC

Got a second PC you do not need all the time?
Connect it to a ZigBee button or an automation.
However you like.

## Automate Windows and Game updates

I like to game every now and then.
The problem, my gaming PC might be off for more than weeks these days.
When a friend calls, I have to download Windows Updates, Game updates, drivers, etc.
And gone is an hour or two of my precious gaming time with friends.

Solution: Automatically power on my PC over night and get all the updates needed.
A full blog post on this setup: [How to Remove the Login Password in Windows 11, Power On with Home Assistant and keep your Steam Games up to Date](https://ajfriesen.com/remove-windows-login-password/)