Return-Path: <linux-clk+bounces-6254-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2F78AD490
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 21:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BD521F252E1
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 19:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0961552E5;
	Mon, 22 Apr 2024 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDqunT3G"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A71219E0;
	Mon, 22 Apr 2024 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713812633; cv=none; b=Gu+QvNWl4J2WEzrXXjkz/58KGkhAZMl7DqtZtc6gruob2H+mxRKIpIVG73dsMIYHtvaZru1R+FU0CBGieCPRChqoTGgXju8hT+YJSBc7/zSx0evEbs6YBx0N6cWf/j1nI6V19L18GNHRJQrvd0Maco2MdPmkZa1GUVIwuK33DoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713812633; c=relaxed/simple;
	bh=925lhqtEOfaU6IsPyiOnRmyr6RDLutiZ1qnFUqL15yw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=kM5BdDm49x6Ixe10AwWUT0DtHCR+VBarirNK5Az4CC8Dj0Vce3H7pmdJaxE8fkaYgzbGzh706fNEoJMVBnS5xaS0flXg40TVIPWG1kd+fmrFZ3DVGh2buIg2BMnqsp+ZeY76m6vw7zUNZAeoFmuXQPPQbXGTqxmJCvZI2P3Tv3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDqunT3G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C47DC113CC;
	Mon, 22 Apr 2024 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713812633;
	bh=925lhqtEOfaU6IsPyiOnRmyr6RDLutiZ1qnFUqL15yw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vDqunT3GLaOsjJUwGdzCGFvLaSHczhEfyOk4CKndxixQNW6pfjz3dvXfcAaW2rEYu
	 bwWuKfAi/adqf+GCcVS7gcUNQw5AbjcXHBqzVSkilDj67ZUOdD8iOYWBwI3+p0OvSI
	 fLr1Q67nLdNG/QAvluAv0gbvYTyB57sH0BTbaOMrcrJt7Zc5c85R84QqNmmBBJeA+Q
	 hVzIAMttOsa6SglNQc3G51n1dKAASjGczcr/iAH9tkuZE/kmQfo3/BSm4KeIrx0EjL
	 71tyYIPDFJK+TwFE6dfPZ1PMZJPzBbtl5ho6f3fqrA7L+GHoMuT4Q4e24BjN9whjge
	 Rt8/MrCdJdgWA==
Message-ID: <f20ce03d307c3e507bacd26d8fa56928.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240415163649.895268-6-cristian.marussi@arm.com>
References: <20240415163649.895268-1-cristian.marussi@arm.com> <20240415163649.895268-6-cristian.marussi@arm.com>
Subject: Re: [PATCH v3 5/5] clk: scmi: Add support for get/set duty_cycle operations
From: Stephen Boyd <sboyd@kernel.org>
Cc: sudeep.holla@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com, quic_nkela@quicinc.com, souvik.chakravarty@arm.com, mturquette@baylibre.com, Cristian Marussi <cristian.marussi@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Apr 2024 12:03:50 -0700
User-Agent: alot/0.10

Quoting Cristian Marussi (2024-04-15 09:36:49)
> Provide the CLK framework callbacks related to get/set clock duty cycle if
> the related SCMI clock supports OEM extended configurations.
>=20
> CC: Michael Turquette <mturquette@baylibre.com>
> CC: Stephen Boyd <sboyd@kernel.org>
> CC: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---

Applied to clk-next

