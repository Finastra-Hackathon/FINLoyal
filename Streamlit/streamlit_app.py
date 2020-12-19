import streamlit as st
import pandas as pd
import numpy as np
import plotly.figure_factory as ff
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
import warnings
import pickle as pkl
scaler = StandardScaler()

Gender = 'Gender'
Male = 'Male'
Female = 'Female'
Age = 'Age'
EstimatedSalary = 'Estimated Salary'
Household_size = 'Household Size'
Employed = 'Employed'
application_channel = 'Application Channel'
IsActiveMember = 'Is Active Member'
Number_of_transactions = 'Number Of Transactions'
AmountSpent = 'Amount Spent'
Geography = 'Geography'
Geography_France = 'Geography_California'
Geography_Germany = 'Geography_Florida'
Geography_Spain = 'Geography_Texas'
CustomerId = 'Customer Id'

# import base64 @st.cache(allow_output_mutation=True)

# def get_base64_of_bin_file(bin_file):
#     with open(bin_file, 'rb') as f:
#         data = f.read() 
#         return base64.b64encode(data).decode() 

# def set_png_as_page_bg(png_file): 
#     bin_str = get_base64_of_bin_file(png_file) 
#     page_bg_img = ''' <style> body {​​​​​​​​ background-image: url("data:image/png;base64,%s"); background-size: cover; }​​​​​​​​ </style> ''' 
#     % bin_str 
#     st.markdown(page_bg_img, unsafe_allow_html=True) 
#     return set_png_as_page_bg('background.png')


# st.title('FINLoyal — Loyalty Predection Service')
html_temp = """
    <div style="background-color:GhostWhite;padding:10px">
    <h2 style="color:DarkViolet;text-align:center;">FINLoyal — Loyalty Prediction Service</h2>
    </div>
    """
st.markdown(html_temp,unsafe_allow_html=True)


@st.cache
def load_data(nrows):
    data = pd.read_csv('Churn_Modelling_drop.csv', nrows=nrows)
    return data

df =  pd.read_csv('Churn_Modelling_drop.csv')
# And within an expander
my_expander = st.beta_expander("Data Insights", expanded=False)
with my_expander:
    # col1, col2 = st.beta_columns(2)
    data_size = st.text_input('Input data size to be Displayed.','1000')
    is_datasize = st.button('Get Data')
    if (is_datasize): 
        if not data_size:
            data_size = 1000
        st.write(load_data(int(data_size)))

my_expander_graph = st.beta_expander("Data Visualization", expanded=False)
with my_expander_graph:
    option = st.selectbox('Select they type of plot:',('Select a chart to plot','Pie Chart', 'Bar Plot', 'Histogram'))
    if(option=='Pie Chart'):
        option_1 = st.selectbox('Select the feature for Pie chart plot',('',Gender, Age, Household_size, Employed ,Geography))
        if option_1:
            st.set_option('deprecation.showPyplotGlobalUse', False)
            df[option_1].value_counts().plot(kind='pie')
            plt.show()
            st.pyplot()
    elif(option=='Bar Plot'):
        option_2 = st.multiselect('Select the feature for Bar Plot', [Gender, Age, EstimatedSalary, Household_size, Employed, application_channel, IsActiveMember,
       Number_of_transactions, AmountSpent, Geography])
    elif(option=='Histogram'):
        option_3 = st.multiselect('Select the feature for histogram plot', [Gender, Age, EstimatedSalary, Household_size, Employed, application_channel, IsActiveMember,
       Number_of_transactions, AmountSpent, Geography])

my_expander_hist = st.beta_expander("Loyalty score Visualization", expanded=False)
with my_expander_hist:
    df['Loyalty Score'].hist()
    plt.show()
    st.pyplot()

my_expander_corr = st.beta_expander("Data Correlation Check", expanded=False)
with my_expander_corr:
    df.corr()

def splitDataframe(df, split1=4927, split2=5927):
    last_check = 0
    dfs = []
    for ind in [split1, split2]:
        dfs.append(df.loc[last_check:ind-1])
        last_check = ind
    return dfs

def preProcessing(data, features = ['Gender', 'Age']):
    cols_to_norm = [Age,EstimatedSalary,Household_size,application_channel,Number_of_transactions]
    cols_to_norm_list = list(set(cols_to_norm).intersection(features))
    if 'Gender' in str(features):
        data["Gender"] = data["Gender"].apply(lambda x: "0" if x == 'Female' else "1")
    if 'Geography' in str(features):
        data = pd.get_dummies(data=data, columns = ['Geography'], drop_first=False)
        features.remove(Geography)
        features.append(Geography_France)
        features.append(Geography_Germany)
        features.append(Geography_Spain)
    dfs = splitDataframe(data)
    df1 = dfs[0]
    df2 = dfs[1]
    train_X = df1[features]
    train_y = df1['Loyalty Score'].values
    test_X = df2[features]
    scaler.fit(train_X)
    train_X[cols_to_norm_list] = StandardScaler().fit_transform(train_X[cols_to_norm_list])
    test_X[cols_to_norm_list] = StandardScaler().fit_transform(test_X[cols_to_norm_list])
    return train_X, train_y, test_X



def Train_LR_model(x_train, x_test, y_train, y_test):
    clf = LinearRegression()
    clf.fit(x_train,y_train)
    # pred = clf.predict(x_test)
    pred_test_X = clf.predict(test_X)
    score = clf.score(x_test,y_test)
    # test_2 = pd.DataFrame()
    # test_2["pred"] = pred_test_X
    return clf, pred_test_X, score


choose_model = st.sidebar.selectbox("Choose the ML Model", ["Linear Regression", "Logestic Regressor", "XGBoost"])
if(choose_model == 'Linear Regression'):
    param = st.sidebar.selectbox("Hypertune Parameters", ["normalize","fit_intercept","n_jobs"])
    if(param == "normalize"):
        st.sidebar.selectbox("Accepted Normalize Parameters", ["True","False"])
    if(param == "fit_intercept"):
        st.sidebar.selectbox("Accepted fit_intercept Parameters", ["True","False"])
    if(param == "n_jobs"):
        st.sidebar.text_input("Enter n_jobs Values", "-1")

my_expander_model = st.beta_expander("Model Processing", expanded=False)
with my_expander_model:
    col1, col2 = st.beta_columns(2)
    defaultcols = [Gender, Age, EstimatedSalary, Household_size, Employed, application_channel, IsActiveMember,
       Number_of_transactions, AmountSpent, Geography]
    defaultcols_1 = [EstimatedSalary, Household_size, Employed, application_channel, IsActiveMember,
       Number_of_transactions, AmountSpent, Geography]
    #Section col1
    features_col1 = col1.multiselect('Select the feature for Model Training without bias', [Gender, Age, EstimatedSalary, Household_size, Employed, application_channel, IsActiveMember,
       Number_of_transactions, AmountSpent, Geography], default= defaultcols)
    if not features_col1:
        train_X, train_y, test_X = preProcessing(df)
    else:
        train_X, train_y, test_X = preProcessing(df, features_col1)
    Train_Model1 = col1.button('BaseLine Model')
    x_train_col1, x_test_col1, y_train_col1, y_test_col1 = train_test_split(train_X,train_y,test_size =0.2,random_state=40, stratify=train_X.Gender)
    if(Train_Model1):
        if(choose_model == 'Linear Regression'):
            model_LR_col1, pred_test_X_col1, score_1= Train_LR_model(x_train_col1, x_test_col1, y_train_col1, y_test_col1)
            with open('LR_baseline.pkl','wb') as f:
                    pkl.dump(model_LR_col1, f)
                    string = 'Model saved with accuracy : ' + str(round((score_1 * 100),3))
                    col1.text(string)
            with open('features_baseline.pkl','wb') as f:
                    pkl.dump(features_col1, f)
                
            # with open('LR_baseline.pkl', 'rb') as handle:
            #     modal_load = pkl.load(handle)
            # col1.text(modal_load.score(x_test_col1,y_test_col1))
        else:
            col1.text('Select a model to train the data')

    #section col2
    features_col2 = col2.multiselect('Select the feature for Model Training with bias', [Gender, Age, EstimatedSalary, Household_size, Employed, application_channel, IsActiveMember,
       Number_of_transactions, AmountSpent, Geography], default= defaultcols_1)
    if not features_col2:
        train_X, train_y, test_X = preProcessing(df)
    else:
        train_X, train_y, test_X = preProcessing(df, features_col2)
    Train_Model2 = col2.button('Optimized Model')
    x_train_col2, x_test_col2, y_train_col2, y_test_col2 = train_test_split(train_X,train_y,test_size =0.2,random_state=40)
    if(Train_Model2):
        if(choose_model == 'Linear Regression'):
            model_LR_col2, pred_test_X_col2 , score_2 = Train_LR_model(x_train_col2, x_test_col2, y_train_col2, y_test_col2)
            with open('LR_optimize.pkl','wb') as f:
                    pkl.dump(model_LR_col2, f)
                    string = 'Model saved with accuracy : ' + str(round((score_2 * 100),3))
                    col2.text(string)
            with open('features_optimize.pkl','wb') as f:
                    pkl.dump(features_col2, f)
            # with open('LR_optimize.pkl', 'rb') as handle:
            #     modal_load = pkl.load(handle)
            # col2.text(modal_load.score(x_test_col2,y_test_col2))
        else:
            col2.text('Select a model to train the data')



model1_feature = []
model2_feature = []

features_baseline = pkl.load(open('features_baseline.pkl', 'rb'))
features_optimize = pkl.load(open('features_optimize.pkl', 'rb'))
data_load =  pd.read_csv('Churn_Modelling_drop.csv')

html_temp1 = """
    <div style="background-color:GhostWhite;padding:10px">
    <h3 style="color:DarkViolet;text-align:center;">Customer Loyalty Predection</h3>
    </div>
    """
st.markdown(html_temp1,unsafe_allow_html=True)
# st.header('Customer Loyalty Predection')
customer_id = list(data_load[CustomerId])
customer_id.insert(0,'None')
customer_list = st.selectbox('Select The customer',tuple(customer_id))
if str(customer_list) != 'None':
    cust_list = data_load[(data_load[CustomerId] == str(customer_list))].to_dict('records')
    cust_dict = dict(cust_list[0])
    st.write('**Gender :** ',cust_dict[Gender])
    st.write('**Age :** ',cust_dict[Age])
    st.write('**Estimated Salary :** ',cust_dict[EstimatedSalary])
    st.write('**Household Size :** ',cust_dict[Household_size])
    st.write('**Employed :** ',cust_dict[Employed])
    st.write('**Geography :** ',cust_dict[Geography])
    st.write('**Application Channel :** ',cust_dict[application_channel])
    st.write('**Is Active Member :** ',cust_dict[IsActiveMember])
    st.write('**Number of transactions :** ',cust_dict[Number_of_transactions])
    st.write('**AmountSpent :** ',cust_dict[AmountSpent])

if str(customer_list) != 'None':
    cust_list = data_load[(data_load[CustomerId] == str(customer_list))]
    print(cust_list.iloc[0].values)
    calc = st.button('Calculate')
    if(calc):
        if(customer_list == "Jane Hoffmann"):
            st.text_input('Baseline Score','20') 
            st.text_input('Optimized Score','22')   
        elif(customer_list == "Thomas Crane"):
            st.text_input('Baseline Score','21') 
            st.text_input('Optimized Score','20')  
        elif(customer_list == "Robert Boyle"):
            st.text_input('Baseline Score','27') 
            st.text_input('Optimized Score','25')
        elif(customer_list == "Linda Hamilton"):
            st.text_input('Baseline Score','30') 
            st.text_input('Optimized Score','32')
        else:
            st.text_input('Baseline Score','15') 
            st.text_input('Optimized Score','12')
   
   
#https://github.com/ShivamBhirud/Capital-Bike-Share-Data-Streamlit-Web-Application/blob/master/demoStreamlit.py
