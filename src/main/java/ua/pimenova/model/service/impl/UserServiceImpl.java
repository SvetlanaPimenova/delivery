package ua.pimenova.model.service.impl;

import ua.pimenova.model.database.dao.UserDao;
import ua.pimenova.model.database.entity.User;
import ua.pimenova.model.exception.DaoException;
import ua.pimenova.model.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User getByID(int id) throws DaoException {
        return userDao.getByID(id);
    }

    @Override
    public List<User> getAll() throws DaoException {
        return userDao.getAll();
    }

    @Override
    public User create(User user) throws DaoException {
        return userDao.create(user);
    }

    @Override
    public boolean update(User user) throws DaoException {
        return userDao.update(user);
    }

    @Override
    public boolean delete(User user) throws DaoException {
        return userDao.delete(user);
    }

    @Override
    public boolean updatePassword(User user) throws DaoException {
        return userDao.updatePassword(user);
    }

    @Override
    public User getByPhone(String phone) throws DaoException {
        return userDao.getByPhone(phone);
    }

    @Override
    public User getByEmail(String email) throws DaoException {
        return userDao.getByEmail(email);
    }

    @Override
    public User getUserByEmailAndPassword(String email, String password) throws DaoException {
        return userDao.getUserByEmailAndPassword(email, password);
    }

    @Override
    public List<User> getAllUsersByCity(String city) throws DaoException {
        return userDao.getAllUsersByCity(city);
    }

    @Override
    public List<User> getAllUsersByPostalCode(String postalCode) throws DaoException {
        return userDao.getAllUsersByPostalCode(postalCode);
    }
}
