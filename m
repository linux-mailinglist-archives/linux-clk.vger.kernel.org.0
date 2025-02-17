Return-Path: <linux-clk+bounces-18076-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB249A36876
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 23:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 064F97A2AC6
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 22:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC6C211712;
	Fri, 14 Feb 2025 22:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCvLjJol"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E4A2116F6;
	Fri, 14 Feb 2025 22:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572721; cv=none; b=epjtTsm0TQKASaQw88iq6bHOd/4utKndlJygHEm9D0jQWwGobV/ayOwN3PcgjpmC/m1tOxLnEsJTkBhytrNqbdFJyl5ZU1DOLnfZR/ZVQY7KGPozHXhym8ebTJycOJ1mhtpvnIBqbd/Mahym1HQUENH2R+OmERQyW5vFeUi9FSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572721; c=relaxed/simple;
	bh=kSzFZITIODrtbtfi3QZLXNhTGEypPy2lYuuuWPkRsxk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3Jz16WzALoyKO2eiRCoZlPtYH9pv7xhoNxVytuD+1GsS9ho9aASmp1/99mpgiwzPKIkFFUWkxZspVTdvcvzaSMJnvLxIk6CaUsfZtAK2fx6ANOMl5R8OF6Qg/PuB+F91dTmZ+kdSADOFxreuhDvsOqJFurEtx5pS5nvHwPTTo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCvLjJol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A013EC4CEEB;
	Fri, 14 Feb 2025 22:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572721;
	bh=kSzFZITIODrtbtfi3QZLXNhTGEypPy2lYuuuWPkRsxk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DCvLjJoljrIKeumMwnpid5tDP67OQHZ7xyXe0C5hKR8IV8od/72Z+VNeVaq+W4DBH
	 hOSDBSaNBXlnLBRoSCovusdaEUP6wsP/7yEZtct+9aFQ5iHkq/QgMtNx/lCZ/bSgHI
	 WgH30X15CAhhvC1+oh1Qz0383RGbIyH2gZE6cYV18UOG/Ji5t3qdC6QUw1I4aiLqpq
	 4fkkf9Ahaq4atDSATWEwe80MZ1I9fAqnvEwLiu2E65SW2G7cyMNbf6FYGTPR9MOHnd
	 31ntcbTRMBEtyCgREyHCuKK1XOoI95BasQQ6Qtx8VN9KzYd5/4AYO2iaB2D06HFH6W
	 F7aBPDMwStN+A==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	quic_srichara@quicinc.com,
	dmitry.baryshkov@linaro.org,
	quic_varada@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Subject: Re: [PATCH v2] clk: qcom: ipq5424: fix software and hardware flow control error of UART
Date: Fri, 14 Feb 2025 16:38:23 -0600
Message-ID: <173957268926.110887.17558733478106270218.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124060914.1564681-1-quic_mmanikan@quicinc.com>
References: <20250124060914.1564681-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Jan 2025 11:39:14 +0530, Manikanta Mylavarapu wrote:
> The UART’s software and hardware flow control are currently not
> functioning correctly.
> 
> For software flow control, the following error is encountered:
> qcom_geni_serial 1a80000.serial: Couldn't find suitable
> clock rate for 56000000, 3500000, 2500000, 1152000, 921600, 19200
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: ipq5424: fix software and hardware flow control error of UART
      commit: 4b28beb882a0a1af0ce47a8a87e7877a3ae6ad36

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

