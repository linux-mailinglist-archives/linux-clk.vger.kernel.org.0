Return-Path: <linux-clk+bounces-10041-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A614093D4A2
	for <lists+linux-clk@lfdr.de>; Fri, 26 Jul 2024 15:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C6321F21FE5
	for <lists+linux-clk@lfdr.de>; Fri, 26 Jul 2024 13:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73ACA176AAE;
	Fri, 26 Jul 2024 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vrHiqUMz"
X-Original-To: linux-clk@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9429F17BB30;
	Fri, 26 Jul 2024 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722001969; cv=none; b=ik+FYQEf2XyHxldvmwUH3HwPacm9MgkyiCIu4BqS+fb/dHfogUOWdigTtSaPDOiijueposTTNmBYQ6yw47ohYfmde28zoI30JUdV3H5mZg/SCfm9zBXCHxZ3Jnm+V/ynNW92gicdP1XTzR4Xu6stvE59ZgQEBuqQwI6lktieL1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722001969; c=relaxed/simple;
	bh=9nRC/P4M2rkDbHl7kazpwZ0dMCuQn5ae5OBYCZPr8e4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc/w/T+YZ+ZY4KAROubepoBytKj+l5v9KVl/Nx8qb6nQH/lETGM/w3DbBoh/zs97wE7TXF7q/47pAQVi8RjsHagp3WBrJODGiWANTvnRNJe1aiX8xsJokeT7FjawNcqD1sSqSmvn+/AFKwAb9HuEkD3nt/F6AFv6dvBy5qvSBgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vrHiqUMz; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46QDqWGK050842;
	Fri, 26 Jul 2024 08:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722001952;
	bh=jga0bcOBHnO3aeHr699McPj2Z8f4UdLGZUMJlsQl6NI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vrHiqUMz1RKAZkeMfI7b+WwuZrEP+HMmCFtVM0nu5vYJu7PZf36kUsWwovmz+Wntt
	 SHHrWkssKug1JGdGdU5DgeA+uXmsSmhNMWRSvwytDTz7KNBRkJ6+BDhVL0BakPHlEC
	 4RqqWtT8YKiZ5+RLJGCFpmsXk96p/UyCGcPaKWUc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46QDqWua068323
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jul 2024 08:52:32 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jul 2024 08:52:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jul 2024 08:52:32 -0500
Received: from localhost (dhruva.dhcp.ti.com [172.24.227.68])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46QDqVxW024066;
	Fri, 26 Jul 2024 08:52:32 -0500
Date: Fri, 26 Jul 2024 19:22:31 +0530
From: Dhruva Gole <d-gole@ti.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] clk: scmi: add is_prepared hook
Message-ID: <20240726135231.hhzp3dqgx64e6kiw@dhruva>
References: <20240726131007.1651996-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726131007.1651996-1-peng.fan@oss.nxp.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On Jul 26, 2024 at 21:10:07 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Some clks maybe default enabled by hardware, so add is_prepared hook
> for non-atomic clk_ops to get the status of the clk. Then when disabling
> unused clks, those unused clks but default hardware on clks could be
> in off state to save power.

Just a nit - reword the commit message as:
Then when disabling the unused clocks, they can be simply turned OFF to
save power.

Also if you can make it still verbose, explain when you expect this
disabling of unused clks to take place exactly? During boot?  Driver probe sequence?
or By some user commands?

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Provider helper __scmi_clk_is_enabled for atomic and non-atomic usage
>  Move is_prepared hook out of SCMI_CLK_STATE_CTRL_SUPPORTED
[...]


-- 
Best regards,
Dhruva Gole <d-gole@ti.com>

