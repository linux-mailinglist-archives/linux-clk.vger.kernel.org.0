Return-Path: <linux-clk+bounces-3724-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DB58589D9
	for <lists+linux-clk@lfdr.de>; Sat, 17 Feb 2024 00:11:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B1BA1F28419
	for <lists+linux-clk@lfdr.de>; Fri, 16 Feb 2024 23:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797651487F6;
	Fri, 16 Feb 2024 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AL1Owh2Y"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E121487F1;
	Fri, 16 Feb 2024 23:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708125050; cv=none; b=mi3Nkhhigx1cAaClK6R1TcEQAhvM40JuXXu/61Hn1hKm6UJQfbuCxcDnuBb0eH8q0yJqIkk/Pa3Mja8Xwvr2pmWvHvrxnsODRm/DaEFz2QKd7BQ06hSOpCDvb+epXHeJB1NnmjjohCet+AYz/5q6t0/N9pTflRaaIUiAXyutTVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708125050; c=relaxed/simple;
	bh=ilcPnMqBWHiYyyezgCPWLMwR5haLH6WNuVaApc8y3DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ayMciMmvo3v3pzX5fsLUTRb3Zq1jspTLkLBjo4hZoLcOP9SQqnL9/1jVPeP0zF5+iorZrp064jAj4gF14lJdd7ZPCDhBhQgnlz67LSigVgqASG9BooAjoWPJXv3qYEIGJMRE0mj3LC3yXxItsGrnbK5eedfnTyjrj8L4kb1HFUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AL1Owh2Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC447C433A6;
	Fri, 16 Feb 2024 23:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708125049;
	bh=ilcPnMqBWHiYyyezgCPWLMwR5haLH6WNuVaApc8y3DE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AL1Owh2YhTxg4KqhR4ZZePjKAKB0HOJeoBrmE9kLJZ4iA/Pvz+o+S8kfW7STUHBsN
	 smCd5XAT/0V6p1rAYUA2SO29u6aWgPpwSGylbYDCxeZKYuRXlTns7/qdCwpKUPUx77
	 HFu+xuG9GNDNL9YRAAv3L4n7Yu7OLlp0PFPq5J6bBVHdTIUOv15X2/R+0iOLJvWuaS
	 u3HK+b+Af/RE8e703/9AaPvjlMq2qrABFToNhiMFTRGOVoxFGxOL0noQFAzphaZGCB
	 fubSrfLWXf3TgPin72CXloFStsJNFhsFA6JBjHt1DRgAypcdF+6S/HecbK5ZcgV2Yo
	 TvmMazWC1/yBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-sdm845: Adjust internal GDSC wait times
Date: Fri, 16 Feb 2024 17:10:35 -0600
Message-ID: <170812504023.18043.444008654617791889.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103-topic-845gdsc-v1-1-368efbe1a61d@linaro.org>
References: <20240103-topic-845gdsc-v1-1-368efbe1a61d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Jan 2024 21:20:18 +0100, Konrad Dybcio wrote:
> SDM845 downstream uses non-default values for GDSC internal waits.
> Program them accordingly to avoid surprises.
> 
> 

Applied, thanks!

[1/1] clk: qcom: dispcc-sdm845: Adjust internal GDSC wait times
      commit: 117e7dc697c2739d754db8fe0c1e2d4f1f5d5f82

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

