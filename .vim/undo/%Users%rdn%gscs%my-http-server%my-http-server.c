Vim�UnDo� ��Ҷ��3�����SD�o�$c��n�"�1&D   �                                  e���    _�                     G        ����                                                                                                                                                                                                                                                                                                                                                             e���    �   f   h          		if (clnt_fd == -1) �   F   H          	int serv_fd; 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             e���     �       �       �   /* @file my-http-server.c    * @author Ryan D. Najac    */   #define _GNU_SOURCE   #include <stdlib.h>   #include <unistd.h>   #include <signal.h>   #include <time.h>   #include <string.h>   #include <arpa/inet.h>   #include <sys/socket.h>   #include <sys/wait.h>       #include "utils.h"            static void die(const char *msg)   {       perror(msg);       exit(EXIT_FAILURE);   }       /*   % * @brief Signal handler for SIGCHLD.   4 * @param sig The signal number (should be SIGCHLD).    *   W * This function is a signal handler for the SIGCHLD signal, which is sent to a process   Y * when one of its child processes terminates or stops. The function reaps all terminated   / * child processes to prevent zombie processes.    */   $static void sigchld_handler(int sig)   {   >	// Loop as long as waitpid finds terminated children to reap.   0	// waitpid with -1 waits for any child process.   '	while (waitpid(-1, NULL, WNOHANG) > 0)   :		; // Empty loop body; all work is done in the condition.   }       /*   9 * @brief Configures signal handling for the application.   & * @return 0 on success, -1 otherwise.    *   U * SIGPIPE is ignored to prevent termination when writing to a closed socket or pipe.   J * SIGCHLD is handled to reap zombie child processes that have terminated.    */   "static int configure_signals(void)   {   	struct sigaction sa;       $	if (sigemptyset(&sa.sa_mask) == -1)   		return -1;       	/* ignore SIGPIPE */   	sa.sa_flags = 0;   	sa.sa_handler = SIG_IGN;   #	if (sigaction(SIGPIPE, &sa, NULL))   		return -1;       	/* handle SIGCHLD */   	sigemptyset(&sa.sa_mask);   )	sa.sa_flags = SA_RESTART | SA_NOCLDSTOP;   "	sa.sa_handler = &sigchld_handler;   #	if (sigaction(SIGCHLD, &sa, NULL))   		return -1;       
	return 0;   }        int main(int argc, char *argv[])   {   	int serv_fd;       	if (argc != 3) {   C		fprintf(stderr, "usage: %s <server-port> <web-root>\n", argv[0]);   		exit(EXIT_SUCCESS);   	}       0	char *serv_port = argv[1], *web_root = argv[2];       	/*   @	 * Configure signal-handling to ignore SIGPIPE so that we don't   >	 * terminate when we calling send() on a disconnected socket.   	 */   	if (configure_signals())   		die("configure_signals()");       	/*   3	 * Construct server socket to listen on serv_port.   	 */   +	serv_fd = create_server_socket(serv_port);   	if (serv_fd == -1)    		die("create_server_socket()");       	/**   	 * Server accept() loop.   	*/   	for (;;) {   >		// We only need sockaddr_in since we only accept IPv4 peers.   		struct sockaddr_in clnt_addr;   )		socklen_t clnt_len = sizeof(clnt_addr);       J		int clnt_fd = accept(serv_fd, (struct sockaddr *)&clnt_addr, &clnt_len);   		if (clnt_fd == -1)   			die("accept()");       		pid_t pid = fork();   		if (pid < 0)   			die("fork()");       S		/* Parent process: close() client socket and continue accept()ing connections. */   		if (pid > 0) {   			close(clnt_fd);   			continue;   		}       K		/* Child process: close() server socket, handle the request, and exit. */   		close(serv_fd);    		char clnt_ip[INET_ADDRSTRLEN];   K		if (!(inet_ntop(AF_INET, &clnt_addr.sin_addr, clnt_ip, sizeof(clnt_ip))))   			die("inet_ntop()");       ,		handle_client(web_root, clnt_fd, clnt_ip);   		exit(EXIT_SUCCESS);   	}   	/* UNREACHABLE */   	close(serv_fd);   
	return 0;   }    5�_�                   g       ����                                                                                                                                                                                                                                                                                                                                                             e��/     �   f   h   �      		if (clnt_fd == -1)5�_�                    g       ����                                                                                                                                                                                                                                                                                                                                                             e��1     �   f   h   �      		if (clnt_fd == -1 )5�_�                    g       ����                                                                                                                                                                                                                                                                                                                                                             e��2     �   f   l   �      		if (clnt_fd == -1)5�_�                    i       ����                                                                                                                                                                                                                                                                                                                                                             e��;     �   h   i          7                // Signal interrupted accept, try again5�_�      	              i       ����                                                                                                                                                                                                                                                                                                                                                             e��;     �   i   k   �    �   i   j   �    5�_�      
           	   j       ����                                                                                                                                                                                                                                                                                                                                                             e��<     �   h   j   �                      continue;   '// Signal interrupted accept, try again�   i   k   �      7                // Signal interrupted accept, try again5�_�   	              
   h       ����                                                                                                                                                                                                                                                                                                                                                             e��?     �   g   i   �      			 if (errno == EINTR) {5�_�   
                 h       ����                                                                                                                                                                                                                                                                                                                                                             e��@     �   g   i   �      			 if (errno == EINTR) 5�_�                    j       ����                                                                                                                                                                                                                                                                                                                                                             e��A     �   i   j                      }5�_�                    i   *    ����                                                                                                                                                                                                                                                                                                                                                             e��I     �   h   �          A                continue; // Signal interrupted accept, try again   			die("accept()");       		pid_t pid = fork();   		if (pid < 0)   			die("fork()");       S		/* Parent process: close() client socket and continue accept()ing connections. */   		if (pid > 0) {   			close(clnt_fd);   			continue;   		}       K		/* Child process: close() server socket, handle the request, and exit. */   		close(serv_fd);    		char clnt_ip[INET_ADDRSTRLEN];   K		if (!(inet_ntop(AF_INET, &clnt_addr.sin_addr, clnt_ip, sizeof(clnt_ip))))   			die("inet_ntop()");       ,		handle_client(web_root, clnt_fd, clnt_ip);   		exit(EXIT_SUCCESS);   	}   	/* UNREACHABLE */   	close(serv_fd);   
	return 0;   }    5�_�                    j       ����                                                                                                                                                                                                                                                                                                                                                             e��O     �   j   l   �      			 �   j   l   �    5�_�                    i       ����                                                                                                                                                                                                                                                                                                                                                             e��Z     �   i   k   �      					   // �   i   k   �    5�_�                    k       ����                                                                                                                                                                                                                                                                                                                                                             e��^    �   j   l   �      			 die("accept()");5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             e���    �         �       �         �    5�_�                    g       ����                                                                                                                                                                                                                                                                                                                                                             e��      �   f   h   �      		if (clnt_fd == -1) {   			if (clntSock == -1) {   !            if (errno == EINTR) {   7                // Signal interrupted accept, try again                   continue;               }5��