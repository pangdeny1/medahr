<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
| Middleware options can be located in `app/Http/Kernel.php`
|
*/

// Homepage Route
Route::get('/', 'WelcomeController@welcome')->name('welcome');

// Authentication Routes
Auth::routes();

// Public Routes
Route::group(['middleware' => 'web'], function() {

    // Activation Routes
    Route::get('/activate', ['as' => 'activate', 'uses' => 'Auth\ActivateController@initial']);

    Route::get('/activate/{token}', ['as' => 'authenticated.activate', 'uses' => 'Auth\ActivateController@activate']);
    Route::get('/activation', ['as' => 'authenticated.activation-resend', 'uses' => 'Auth\ActivateController@resend']);
    Route::get('/exceeded', ['as' => 'exceeded', 'uses' => 'Auth\ActivateController@exceeded']);

    // Socialite Register Routes
    Route::get('/social/redirect/{provider}', ['as' => 'social.redirect', 'uses' => 'Auth\SocialController@getSocialRedirect']);
    Route::get('/social/handle/{provider}', ['as' => 'social.handle', 'uses' => 'Auth\SocialController@getSocialHandle']);

    // Route to for user to reactivate their user deleted account.
    Route::get('/re-activate/{token}', ['as' => 'user.reactivate', 'uses' => 'RestoreUserController@userReActivate']);

});

// Registered and Activated User Routes
Route::group(['middleware' => ['auth', 'activated']], function() {

    // Activation Routes
    Route::get('/activation-required', ['uses' => 'Auth\ActivateController@activationRequired'])->name('activation-required');
    Route::get('/logout', ['uses' => 'Auth\LoginController@logout'])->name('logout');

    //  Homepage Route - Redirect based on user role is in controller.
   // Route::get('/home', ['as' => 'public.home',   'uses' => 'UserController@index']);

    Route::get('/home', ['as' => 'public.home',   'uses' => 'UserController@index']);

    // Show users profile - viewable by other users.
    Route::get('profile/{username}', [
        'as'        => '{username}',
        'uses'      => 'ProfilesController@show'
    ]);

});

// Registered, activated, and is current user routes.
Route::group(['middleware'=> ['auth', 'activated', 'currentUser']], function () {

    // User Profile and Account Routes
    Route::resource(
        'profile',
        'ProfilesController', [
            'only'  => [
                'show',
                'edit',
                'update',
                'create'
            ]
        ]
    );
    Route::put('profile/{username}/updateUserAccount', [
        'as'        => '{username}',
        'uses'      => 'ProfilesController@updateUserAccount'
    ]);
    Route::put('profile/{username}/updateUserPassword', [
        'as'        => '{username}',
        'uses'      => 'ProfilesController@updateUserPassword'
    ]);
    Route::delete('profile/{username}/deleteUserAccount', [
        'as'        => '{username}',
        'uses'      => 'ProfilesController@deleteUserAccount'
    ]);

    // Route to show user avatar
    Route::get('images/profile/{id}/avatar/{image}', [
        'uses'      => 'ProfilesController@userProfileAvatar'
    ]);

    // Route to upload user avatar.
    Route::post('avatar/upload', ['as' => 'avatar.upload', 'uses' => 'ProfilesController@upload']);

});

// Registered, activated, and is admin routes.
Route::group(['middleware'=> ['auth', 'activated', 'role:admin']], function () {

    Route::resource('/users/deleted', 'SoftDeletesController', [
        'only' => [
            'index', 'show', 'update', 'destroy',
        ]
    ]);

    Route::resource('users', 'UsersManagementController', [
        'names' => [
            'index' => 'users',
            'destroy' => 'user.destroy'
        ],
        'except' => [
            'deleted'
        ]
    ]);

    Route::resource('themes', 'ThemesManagementController', [
        'names' => [
            'index' => 'themes',
            'destroy' => 'themes.destroy'
        ]
    ]);

    Route::get('logs', '\Rap2hpoutre\LaravelLogViewer\LogViewerController@index');
    Route::get('php', 'AdminDetailsController@listPHPInfo');
    Route::get('routes', 'AdminDetailsController@listRoutes');
    Route::get('emp','employee@index');
    Route::get('retailers','RetailersManagementController@index');
    Route::get('deliverynotes','RetailersManagementController@deliverynotes');
    Route::get('redemptions','RetailersManagementController@redemptions');
    Route::get('issuances','RetailersManagementController@issuances');
    Route::get('map','RetailersManagementController@retailermap');
    Route::get('paymentrequest','RetailersManagementController@paymentrequest');

    Route::get('employeemaster','employee\employeemaster@index');
    Route::get('addemployee','employee\employeemaster@addemployee');
    Route::post('employeestore','employee\employeemaster@store');
    //Route::get('editemployee/{employeeid}/edit','employee\employeemaster@edit');
    Route::get('editemployee/{id}','employee\employeemaster@edit');
    Route::post('employeeupdate/{id}','employee\employeemaster@update');
    Route::get('employeedelete/{id}','employee\employeemaster@destroy');
    Route::get('prlpayroll','employee\employeemaster@prlpayroll');
    Route::get('editemployeedetail/{id}','employee\employeemaster@editemployeedetail');

    Route::get('jobs','job\JobsController@index');
    Route::get('addjob','job\JobsController@create');
    Route::post('new_job','job\JobsController@store');
    Route::get('showjob/{id}','job\JobsController@show');
    Route::get('editjob/{id}','job\JobsController@edit');
    Route::post('update_job/{id}','job\JobsController@update');
    Route::get('deletejob/{id}','job\JobsController@destroy');

    Route::get('viewjobgroups','job\jobgroupsController@index');
    Route::get('createjobgroup','job\jobgroupsController@create');
    Route::post('addjobgroup','job\jobgroupsController@store');
    Route::get('showjobgroup/{id}','job\jobgroupsController@show');
    Route::get('editjobgroup/{id}','job\jobgroupsController@edit');
    Route::post('updatejobgroup/{id}','job\jobgroupsController@update');
    Route::get('deletejobgroup/{id}','job\jobgroupsController@destroy');

    Route::post('addbranch','branch\branchcontroller@store');
    Route::get('createbranch','branch\branchcontroller@create');
    Route::get('viewbranches','branch\branchcontroller@index');
    Route::get('editbranch/{id}','branch\branchcontroller@edit');
    Route::post('updatebranch/{id}','branch\branchcontroller@update');
    Route::get('deletebranch/{id}','branch\branchcontroller@destroy');
    Route::get('showbranch/{id}','branch\branchcontroller@show');

    Route::post('adddepartment','department\DepartmentsController@store');
    Route::get('createdepartment','department\DepartmentsController@create');
    Route::get('viewdepartments','department\DepartmentsController@index');
    Route::get('editdepartment/{id}','department\DepartmentsController@edit');
    Route::post('updatedepartment/{id}','department\DepartmentsController@update');
    Route::get('deletedepartment/{id}','department\DepartmentsController@destroy');
    Route::get('showdepartment/{id}','department\DepartmentsController@show');

    Route::post('addcompany','company\companiesController@store');
    Route::get('createcompany','company\companiesController@create');

    Route::post('addsss','sss\SssController@store');
    Route::get('createsss','sss\SssController@create');

    Route::post('addsalary','salary\SalariesController@store');
    Route::get('createsalary','salary\SalariesController@create');

    Route::post('addpayrollperiod','payroll\payrollsController@store');
    Route::get('showpayroll/{id}','payroll\payrollsController@show');
    Route::get('editpayroll/{id}','payroll\payrollsController@edit');
    Route::post('updatepayroll/{id}','payroll\payrollsController@update');
    Route::get('deletepayroll/{id}','payroll\payrollsController@destroy');
    Route::get('createpayrollperiod','payroll\PayrollsController@create');
    Route::get('viewpayrollperiods','payroll\PayrollsController@index');
    Route::post('generate/{id}','payroll\payrollsController@generate');

    //qualifications

    Route::post('addqualification','qualification\qualificationscontroller@store');
    Route::get('showqualification/{id}','qualification\qualificationscontroller@show');
    Route::get('editqualification/{id}','qualification\qualificationscontroller@edit');
    Route::post('updatequalification/{id}','qualification\qualificationscontroller@update');
    Route::get('deletequalification/{id}','qualification\qualificationscontroller@destroy');
    Route::get('createqualification','qualification\qualificationscontroller@create');
    Route::get('viewqualifications','qualification\qualificationscontroller@index');

    //employee qualifications

    Route::post('addemployeequalification','qualification\employeequalificationscontroller@store');
    Route::get('showemployeequalification/{id}','qualification\employeequalificationscontroller@show');
    Route::get('editemployeequalification/{id}','qualification\employeequalificationscontroller@edit');
    Route::post('updateemployeequalification/{id}','qualification\employeequalificationscontroller@update');
    Route::get('deleteemployeequalification/{id}','qualification\employeequalificationscontroller@destroy');
    Route::get('createemployeequalification','qualification\employeequalificationscontroller@create');
    Route::get('viewemployeequalifications','qualification\employeequalificationscontroller@index');

    //qualification level

    Route::post('addqualificationlevel','qualification\qualificationlevelscontroller@store');
    Route::get('showqualificationlevel/{id}','qualification\qualificationlevelscontroller@show');
    Route::get('editqualificationlevel/{id}','qualification\qualificationlevelscontroller@edit');
    Route::post('updatequalificationlevel/{id}','qualification\qualificationlevelscontroller@update');
    Route::get('deletequalificationlevel/{id}','qualification\qualificationlevelscontroller@destroy');
    Route::get('createqualificationlevel','qualification\qualificationlevelscontroller@create');
    Route::get('viewqualificationlevels','qualification\qualificationlevelscontroller@index');

    //institution
    Route::post('addinstitution','institution\institutescontroller@store');
    Route::get('showinstitution/{id}','institution\institutescontroller@show');
    Route::get('editinstitution/{id}','institution\institutescontroller@edit');
    Route::post('updateinstitution/{id}','institution\institutescontroller@update');
    Route::get('deleteinstitution/{id}','institution\institutescontroller@destroy');
    Route::get('createinstitution','institution\institutescontroller@create');
    Route::get('viewinstitutions','institution\institutescontroller@index');
//dependants
    Route::post('adddependant','dependant\dependantscontroller@store');
     Route::post('addemployeedependant','dependant\dependantscontroller@storeemployeedependant');
    Route::get('showdependant/{id}','dependant\dependantscontroller@show');
    Route::get('editdependant/{id}','dependant\dependantscontroller@edit');
    Route::post('updatedependant/{id}','dependant\dependantscontroller@update');
    Route::get('deletedependant/{id}','dependant\dependantscontroller@destroy');
    Route::get('createdependant','dependant\dependantscontroller@create');
    
    Route::get('createdependant/{id}','dependant\dependantscontroller@createemployeedependant');
    Route::get('viewdependants','dependant\dependantscontroller@index');

    //work Experience
    Route::post('addworkexperience','workexperience\workexperiencecontroller@store');
    Route::get('showworkexperience/{id}','workexperience\workexperiencecontroller@show');
    Route::get('editworkexperience/{id}','workexperience\workexperiencecontroller@edit');
    Route::post('updateworkexperience/{id}','workexperience\workexperiencecontroller@update');
    Route::get('deleteworkexperience/{id}','workexperience\workexperiencecontroller@destroy');
    Route::get('createworkexperience','workexperience\workexperiencecontroller@create');
    Route::get('viewworkexpiriences','workexperience\workexperiencecontroller@index');


    Route::get('testreport','report\reportcontroller@test');

    Route::get('testpdf','report\reportcontroller@testpdf');


     Route::post('employeebio','report\reportscontroller@employeebio');
     Route::get('reportform','report\reportscontroller@reportform');

     Route::get('form','form\FormController@create');
     Route::post('form','form\FormController@store');
     Route::get('formlist','form\FormController@index');
     Route::get('createimage/{id}','form\FormController@createimage');
     Route::post('updateimage','form\FormController@updateimage');
     
     
});