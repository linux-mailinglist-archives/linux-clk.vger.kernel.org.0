Return-Path: <linux-clk+bounces-26572-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3121CB32D33
	for <lists+linux-clk@lfdr.de>; Sun, 24 Aug 2025 05:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA082074FC
	for <lists+linux-clk@lfdr.de>; Sun, 24 Aug 2025 03:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69014248F74;
	Sun, 24 Aug 2025 02:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhU24RVt"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1A32472B7;
	Sun, 24 Aug 2025 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004178; cv=none; b=bA0mgm1enZ9OSFaCIqkEXZXf6pfiqU/qxfOsUdwlDtshCzCTdogMwhr372XSNtZL2uP6qQ3I4/NHFL3vjLDqXG1b3Sg7bFiPcMRf0Bbb8Sg47RJjmoZmIe0iq2ykWdB+q6sQM4q3EHSclca/DhZuFAhVJui30a3eX5PXV5soApI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004178; c=relaxed/simple;
	bh=PucYGCWkBI4TKCCmZzRO+bAW2dkzIdGDNte2F/ShbAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V5YojUzv86nRjp+dDwAEf8NpQxs5Zz4u1n6Y/x231gdJ/Uc56ZyMddkn8ICA2Ph2itzdMGPhuqb7j/YGzkXQMIYaxxs7ProttKgyxzB4VzUCVPtplbVhBhEKAzWk7AUlevdz7oFMUeZZ0ymp00fVDEf1PqmGZTfHgJiMWBvENOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhU24RVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E736DC113CF;
	Sun, 24 Aug 2025 02:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004177;
	bh=PucYGCWkBI4TKCCmZzRO+bAW2dkzIdGDNte2F/ShbAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lhU24RVtlblp+qignk/TdaMMlGr0vISC+mFhC8P6MDqUj2Ehp53OGYopf5ZitW/VP
	 MOSeGkzXSk3QE048dmM5FmYSzWBJ4p+Odu5LTbyEzEWA9N+nWUXRa1Ghdb2NLEktbK
	 vm8JfzQjgSjXXh44scAw52RF9wHlm6QO9yDTH5gjKLxd3yKSUA4NiRhsySQSaq7q3E
	 VLwLmUHMy5vCCd4sIv+efsSwa29di1NB709BnQ8ToFjuNYWwXIg1bq788p+MQ8GDeq
	 cxh2fvxG/J71L4WNBRSNs2t3XFGkpFzFU5yyVDwTghW70Ltnipi3hd6CVG23ujyvXB
	 FLDPVmVCPDCkQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nickolay Goppen <setotau@yandex.ru>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 0/2] Add LPASS/CDSP vote clocks/GDSCs for SDM660
Date: Sat, 23 Aug 2025 21:55:51 -0500
Message-ID: <175600415283.952266.2833823503786212757.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
References: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 Aug 2025 19:56:50 +0300, Nickolay Goppen wrote:
> This patch series adds LPASS/CDSP vote clocks/GDSCs to gcc-sdm660 driver.
> These clocks are needed for properly functioning of SMMUs related to the
> audio/compute DSPs.
> 
> 

Applied, thanks!

[2/2] clk: qcom: gcc-sdm660: Add missing LPASS/CDSP vote clocks
      commit: d9f1c08cf2648184c58eb57159232b5f0b818bbf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

