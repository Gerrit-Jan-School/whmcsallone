{* filepath: /templates/AllOne/clientareahome.tpl *}
<link rel="stylesheet" href="{$WEB_ROOT}/templates/AllOne/css/allone-dashboard.css">

<div class="glass-container">
  <div class="glass-header">
    <div class="icon"><i class="fas fa-user"></i></div>
    <div>
      <h2 style="margin:0 0 4px 0;">Welcome, {$client_first_name}!</h2>
      <span class="glass-badge">Active</span>
      <span class="glass-badge">Balance: {$client_credit}</span>
    </div>
  </div>
  <input type="text" class="glass-search" placeholder="Search services, invoices, tickets..." oninput="filterDashboard()">

  <h3 style="margin-top:24px;">Your Services</h3>
  <table class="glass-table">
    <thead>
      <tr>
        <th>Product</th>
        <th>Status</th>
        <th>Next Due</th>
        <th>Manage</th>
      </tr>
    </thead>
    <tbody id="servicesTable">
      {foreach $services as $service}
      <tr>
        <td>{$service.product}</td>
        <td><span class="glass-badge">{$service.statustext}</span></td>
        <td>{$service.nextduedate}</td>
        <td><a href="clientarea.php?action=productdetails&id={$service.id}">View</a></td>
      </tr>
      {/foreach}
    </tbody>
  </table>
</div>

<script>
function filterDashboard() {
  const input = document.querySelector('.glass-search').value.toLowerCase();
  document.querySelectorAll('#servicesTable tr').forEach(row => {
    row.style.display = row.textContent.toLowerCase().includes(input) ? '' : 'none';
  });
}
</script>