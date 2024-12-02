Return-Path: <linux-clk+bounces-15214-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D097E9E0982
	for <lists+linux-clk@lfdr.de>; Mon,  2 Dec 2024 18:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB758BC516C
	for <lists+linux-clk@lfdr.de>; Mon,  2 Dec 2024 15:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56AD193092;
	Mon,  2 Dec 2024 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqpC034J"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988518C013;
	Mon,  2 Dec 2024 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154681; cv=none; b=BYsL4ANok7NaP3jOqnNqZUceutgp2209NQOviVszdS7255oECjJkqkxTwkA7JxdPh9T8uKZ03mScPEIZ/DHbcZ4MkcUsemJRDHgywFDEVqOD8ENrTuO4ZKtyvst9Sg3KO5HUj+xb7i/ROZZ5Cqo1r/y44YRnGF2ya9MQDFaOLRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154681; c=relaxed/simple;
	bh=Y4A4qHZHup2wsRmnE4WbA6z9NaH0GWGpGmf46L46XCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxIq8y+F+eSbpC0aCPO+H+c23uwhKKxU96IuDgHtzIUfHc3nSq1e2Jm76YV87ntejfjzF+chX/GWbUm42yXmuuQfNbeEepfXqh0p4jgqakmFKPfRgU3ojgdh4PQ9rAjj5uKgNXMXpMcRpiVeWQszY1xByl45qA/UTJzfXgWAbh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqpC034J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FC0C4CEDA;
	Mon,  2 Dec 2024 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154681;
	bh=Y4A4qHZHup2wsRmnE4WbA6z9NaH0GWGpGmf46L46XCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DqpC034Jt7DzoLaMWiGyvRXgDTXajsCx5bMpbc1wgyYHQugnWDlwJsH2HEw0Enj54
	 MayfQDfvz0Q6SrWdePdsJFjVNMDdqVqpjsoXtij/I6C7fsRqJvdJuDGMb/bYSllBgp
	 yqwoUeBRYMwLkUsNCll5z3jJaN+RESHKl9MSsL/z/6Vkwz2GUL/vWfs36EF+cUg5xn
	 +9qz/tP4yfonm3l1LFFtIMiKPLCbL8J0R7mWBy4sKyloqtjG2TjyDlMaNaU+3Lku8v
	 YovOsPnQ1bUDU9kiIksOKlqfvnVYmAkte1FdYZKQDxiNcBUDKlcCOgnx53sD7OFD6v
	 EXri50f3BM9bA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 0/4] Add GCC and RPMH clock controller for QCS615 SoC
Date: Mon,  2 Dec 2024 09:51:06 -0600
Message-ID: <173315466525.263019.3458125988541133343.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com>
References: <20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Oct 2024 17:22:49 +0530, Taniya Das wrote:
> Add support for Global clock controller(GCC) and the RPMH clock
> controller for the Qualcomm QCS615 SoC.
> 
> The QCS615 SoC is added as part of the below series.
> https://lore.kernel.org/all/20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com/
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: clock: qcom: Add QCS615 GCC clocks
      commit: f4d3d7340e719dd3d2c23ce8d6c360e2f93ba7e4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

