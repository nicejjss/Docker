<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\BaseController;
use App\Services\User\CreateCustomerService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;

class CreateUserController extends BaseController
{

    protected CreateCustomerService $service;

    /**
     * @param CreateCustomerService $service
     */
    public function __construct(CreateCustomerService $service)
    {
        $this->service = $service;
    }

    /**
     * @param Request $request
     * @return string
     */
    public function createUser(Request $request)
    {

        $validator = Validator::make($request->all(),
            [
                'username' => 'required|string|max:255|unique:users',
                'full_name' => 'required|string|max:255',
                'address' => 'required|string|max:255',
                'phone_number' => 'required|string|max:255',
                'email' => 'required|string|email:rfc,dns|max:255|unique:users',
                'password' => 'required|string|min:8|max:255|confirmed'
            ]
        );

        if ($validator->fails()) {
            return $this->sendError(['errors' => $validator->errors()], "validated fails",
                Response::HTTP_UNPROCESSABLE_ENTITY);
        } else {
            $error = $this->service->execute($request->all());
            if (strlen($error) > 0) {
                return $this->sendError(['errors' => ""], $error);
            } else {
                return $this->sendSuccess();

            }
        }


    }


}
