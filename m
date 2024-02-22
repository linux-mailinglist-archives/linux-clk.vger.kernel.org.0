Return-Path: <linux-clk+bounces-3957-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7088F85F47B
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 10:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BE532817E6
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 09:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1BD381D5;
	Thu, 22 Feb 2024 09:34:40 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C8038399;
	Thu, 22 Feb 2024 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708594479; cv=none; b=Ajs2Rx63qRct8zHem8lNWyMEHNFARSpL4cfRNz08GzvrfrJWdZy6hYtyTn+W0htE5RhXFtafNlPIHkl1+PnHQUz+DTAZLdwh3HrdRgvDA+jIduAA7sXYXzPdpaPaRNz14eWWOA61Cm93PI8zD7aKCC6CObccUpWvpDBIP8aTGnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708594479; c=relaxed/simple;
	bh=CpKNoAjcvJj23mMLIFiquS2CwmW6w7/+v3qTae+GNZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n7mD6AQP59DJi22Pm1rK4U6EYb4huhZmodsrP80UjcLXdDEMKhLzCDuNqOX4NG8aqPHgynQKH2OG/K6YOiHouiqAosckg8peBqFcaOYUqasAcjmxJQBSoEWBJaHshxDUsLXeBcDaXRIiCztwAHDpVPYWPGIuPIiVQlhwrkUcn+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D5BE1007;
	Thu, 22 Feb 2024 01:35:15 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FACD3F766;
	Thu, 22 Feb 2024 01:34:35 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V4 1/2] firmware: arm_scmi: Implement Clock get permissions
Date: Thu, 22 Feb 2024 09:34:26 +0000
Message-ID: <170859423232.108904.12518027607345269340.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240121110901.1414856-1-peng.fan@oss.nxp.com>
References: <20240121110901.1414856-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 21 Jan 2024 19:09:00 +0800, Peng Fan (OSS) wrote:
> ARM SCMI Spec 3.2 introduces Clock Get Permission command. This patch
> is to add the support. Add three bool entries to scmi_clock_info to
> indicate the operation is forbidden or not. If the CLOCK_GET_PERMISSIONS
> command is not supported, the three bool variables will default
> set to false, otherwise they will be set according to the return result
> of CLOCK_GET_PERMISSIONS.
> 
> [...]

When I was about to ask for Stephen's ack for 2/2, I noticed an issue
now, will repond to it directly.

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: Implement Clock get permissions
      https://git.kernel.org/sudeep.holla/c/dc36561e1548

--
Regards,
Sudeep


