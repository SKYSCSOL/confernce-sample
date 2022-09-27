import { environment } from '@environment';

const rootApiUrl = environment.apiRootUrl;

export const ApiConfig = {

    ConferenceApiConfig: {
        getCountry:`/api/Conference/getCountry`,
        getCity:`/api/Conference/getCity`,
        getUser:`/api/Conference/getUser`,  
        searchCompany:`/api/Conference/SearchCompany`,
        getAllCompaniesCount:`/api/Conference/getAllCompaniesCount`,
        getAllUserByCompanyName:`/api/Conference/getAllUserByCompanyName`         
    }
};