Return-Path: <linux-clk+bounces-7370-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651968D2A5F
	for <lists+linux-clk@lfdr.de>; Wed, 29 May 2024 04:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 204BB28B919
	for <lists+linux-clk@lfdr.de>; Wed, 29 May 2024 02:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1C315B98A;
	Wed, 29 May 2024 02:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVsnwEk/"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EF315B97C;
	Wed, 29 May 2024 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948135; cv=none; b=DebIv9vvNHPcqSzXKmRTngtXJcAX/xjkUd0H5+3+TdL/I2lRIdZD1s7CpgDKIkuUCL8oLuSAsS06HSLlkVEtrUVCN3+wjTtxaJTXt3QoeI6fX3rM1yD2le3pj6PmZEHsgjlBf4NY0rBg4+fvBgXuFt5Axwjb/cgSkGBxWrgsTi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948135; c=relaxed/simple;
	bh=Ht98n3uyX7/ET9LzMfbLEeZ6yp0xwk/rw4foIuFmNsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RpaSW49R/mEumFfGOpUh0gUoV1ppIv+3pHIMGxbsYOBC8BrjVTiiJc9e9oMlkkdAFzP54TtDW4sIb32PyElOsoHmXKcFkcYgeUi7IYcwfU0eRU2rzQh+TqUhxkuzz11lpG7d4KcZJ7vMS+7Tg+DiLOBCBvaJm6mEtApOohE0jf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVsnwEk/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC7DC4AF07;
	Wed, 29 May 2024 02:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716948134;
	bh=Ht98n3uyX7/ET9LzMfbLEeZ6yp0xwk/rw4foIuFmNsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BVsnwEk/85Rc/xqcdVeJNV2FSVWKDLZvWv/YT1ZxnlWADsciI6kpbXQA8D1FPtTj2
	 QXCo69FAwzFK9oARFMEChJjJVtE80AlDjz3blNAJrdbe6KMr3wXP6nCdEFvMpOlnhh
	 zLBubSncSrKyWkPKsFjaMa2/wKE5VxuK4UcpOPFVDGYq8GLJgT5MGseXUmsonTpirA
	 aP1hxkL3lEOkSukZCw5srS84mZ1qTn8BJ8GK94pDgj/2dCd7ETfoBoKUFGXDUZ5ux5
	 BAgW53Qn6BvgZfmtY8agX08OwJqWFVMCkNpRYjQ4nuUtajVMK2FKb5FY8j5T657chq
	 NlsjLsFhsSNjg==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] Convert qcom,hfpll documentation to yaml + related changes
Date: Tue, 28 May 2024 21:01:53 -0500
Message-ID: <171694812070.574781.3127154907434506746.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240218-hfpll-yaml-v2-0-31543e0d6261@z3ntu.xyz>
References: <20240218-hfpll-yaml-v2-0-31543e0d6261@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 18 Feb 2024 21:57:24 +0100, Luca Weiss wrote:
> Finally touch the hfpll doc and convert it to yaml, and do some related
> changes along the way.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: qcs404: Use qcs404-hfpll compatible for hfpll
      commit: 839936d9676bdc2e4dde63631131feb8870fa4d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

