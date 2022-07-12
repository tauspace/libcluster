defmodule Cluster.Logger do
  @moduledoc false
  require Logger

  def debug(t, msg) do
    case Application.get_env(:libcluster, :debug, false) do
      dbg when dbg in [nil, false, "false"] ->
        :ok

      _ ->
        Logger.debug(log_message(t, msg))
    end
  end
  
  def info(t, msg) do
    case Application.get_env(:libcluster, :info, false) do
      info when info in [nil, false, "false"] ->
        :ok

      _ ->
        Logger.info(log_message(t, msg))
    end
  end
  
  def warn(t, msg) do
    case Application.get_env(:libcluster, :warn, false) do
      warn when warn in [nil, false, "false"] ->
        :ok

      _ ->
        Logger.warn(log_message(t, msg))
    end
  end

  def error(t, msg) do
    case Application.get_env(:libcluster, :error, false) do
      e when e in [nil, false, "false"] ->
        :ok

      _ ->
        Logger.error(log_message(t, msg))
    end
  end

  @compile {:inline, log_message: 2}
  defp log_message(t, msg) do
    "[libcluster:#{t}] #{msg}"
  end
end

