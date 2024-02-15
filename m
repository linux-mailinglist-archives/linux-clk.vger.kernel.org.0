Return-Path: <linux-clk+bounces-3646-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058EE85704F
	for <lists+linux-clk@lfdr.de>; Thu, 15 Feb 2024 23:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E4A282EFB
	for <lists+linux-clk@lfdr.de>; Thu, 15 Feb 2024 22:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3256153BD3;
	Thu, 15 Feb 2024 22:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Jj+LmhxR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8311474C1;
	Thu, 15 Feb 2024 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034921; cv=none; b=ii2NG30ceN6b840RH3eMKbOgvzrpw5tbLDEsjCLpFzVp5gJ2aBmuqCOwFRkVfIWMMrN1fdv5hoJgTd4FkmX3Zee9m/Z/m9FhqVV1CzI1b14mYss7j9qZUf+g6nM3+20bb3zS1AKB1iyHcmfiEneKtidgKPuOQ7tdKt0AH/pLRyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034921; c=relaxed/simple;
	bh=3nimcBkyHMSfym8s4tUd4i+bP6FP4+nFWT7XoE1U7e0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=arqa/8F1ymIyL0hZqN4t1Ih5BvqXk0x7RNlSxkHQW79Z9aRwFSMkLsW9Y1C2uaC35AELDm0bh6o0jOus8usm6jZCwIsfl8heFLkh5IBkDU14XoBwU3aXZNuHYZudIZcCi72LwXztMfawtqH8Ak2NuOAQwVlGoQb6A9eRdUV/e5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Jj+LmhxR; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FL0nM9010649;
	Thu, 15 Feb 2024 22:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zrnHDAhdPUnbtmjsykKg9BbRlBjR1tZ8tUSGR8/dp0k=;
 b=Jj+LmhxRNdBuAR/1xT1pcGhL5Twy853ojKYf36tPXN1ZObIhuetJTG1ea7adSNuQobNl
 1Hu106y2tWn08gVBKrBDxB9RHGrG3y3CRIQC92PWycWFjFKkm8KKL1Cg+B1+etRaW464
 ts40lbY7KX8Oq9cvfwWdjKOo8hkTuYmgltZ62prWzMMw7FHtN5N+f5jndzsHrqf8qeW5
 nJunvgDMPp28cZHT5fiVsVeTBzOVT3Ef+gW0aeXnzy7jxox9rpBvNvusWbMTAz1t2k2S
 zZalbQFamA4Acc6HP+g1f0TQGddf9/SKs9hMs8vNfEPc9sy93jPvDcaNLuwtK7lmM2xD Fw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9q8n597p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:10 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJfrBV016479;
	Thu, 15 Feb 2024 22:08:09 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6mymyhc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:09 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM87OO5505808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:09 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E88ED5807D;
	Thu, 15 Feb 2024 22:08:06 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9860058064;
	Thu, 15 Feb 2024 22:08:06 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:06 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 14/33] fsi: hub: Use common initialization and link enable
Date: Thu, 15 Feb 2024 16:07:40 -0600
Message-Id: <20240215220759.976998-15-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240215220759.976998-1-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iOVfYgi2tLwUNzLc3aTC_wQ4cdI-SGai
X-Proofpoint-ORIG-GUID: iOVfYgi2tLwUNzLc3aTC_wQ4cdI-SGai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=809
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

Set up an FSI regmap for the hub master to use the new common
master initialization and link enable procedures.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-hub.c | 141 ++++++-----------------------------
 1 file changed, 23 insertions(+), 118 deletions(-)

diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 111bf7a11458..92aa07055c56 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -9,6 +9,7 @@
 #include <linux/fsi.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include "fsi-master.h"
@@ -16,8 +17,6 @@
 
 #define FSI_ENGID_HUB_MASTER		0x1c
 
-#define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
-
 /*
  * FSI hub master support
  *
@@ -78,134 +77,33 @@ static int hub_master_break(struct fsi_master *master, int link)
 	return hub_master_write(master, link, 0, addr, &cmd, sizeof(cmd));
 }
 
-static int hub_master_link_enable(struct fsi_master *master, int link,
-				  bool enable)
-{
-	struct fsi_master_hub *hub = to_fsi_master_hub(master);
-	int idx, bit;
-	__be32 reg;
-	int rc;
-
-	idx = link / 32;
-	bit = link % 32;
-
-	reg = cpu_to_be32(0x80000000 >> bit);
-
-	if (!enable)
-		return fsi_device_write(hub->upstream, FSI_MCENP0 + (4 * idx),
-					&reg, 4);
-
-	rc = fsi_device_write(hub->upstream, FSI_MSENP0 + (4 * idx), &reg, 4);
-	if (rc)
-		return rc;
-
-	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
-
-	return 0;
-}
-
 static void hub_master_release(struct device *dev)
 {
 	struct fsi_master_hub *hub = to_fsi_master_hub(to_fsi_master(dev));
 
+	regmap_exit(hub->master.map);
 	kfree(hub);
 }
 
-/* mmode encoders */
-static inline u32 fsi_mmode_crs0(u32 x)
-{
-	return (x & FSI_MMODE_CRS0MASK) << FSI_MMODE_CRS0SHFT;
-}
-
-static inline u32 fsi_mmode_crs1(u32 x)
-{
-	return (x & FSI_MMODE_CRS1MASK) << FSI_MMODE_CRS1SHFT;
-}
-
-static int hub_master_init(struct fsi_master_hub *hub)
-{
-	struct fsi_device *dev = hub->upstream;
-	__be32 reg;
-	int rc;
-
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
-			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	rc = fsi_device_write(dev, FSI_MRESP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	/* Initialize the MFSI (hub master) engine */
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK
-			| FSI_MRESP_RST_MCR | FSI_MRESP_RST_PYE);
-	rc = fsi_device_write(dev, FSI_MRESP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(FSI_MECTRL_EOAE | FSI_MECTRL_P8_AUTO_TERM);
-	rc = fsi_device_write(dev, FSI_MECTRL, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(FSI_MMODE_EIP | FSI_MMODE_ECRC | FSI_MMODE_EPC
-			| fsi_mmode_crs0(1) | fsi_mmode_crs1(1)
-			| FSI_MMODE_P8_TO_LSB);
-	rc = fsi_device_write(dev, FSI_MMODE, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(0xffff0000);
-	rc = fsi_device_write(dev, FSI_MDLYR, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(~0);
-	rc = fsi_device_write(dev, FSI_MSENP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	/* Leave enabled long enough for master logic to set up */
-	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
-
-	rc = fsi_device_write(dev, FSI_MCENP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	rc = fsi_device_read(dev, FSI_MAEB, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(FSI_MRESP_RST_ALL_MASTER | FSI_MRESP_RST_ALL_LINK);
-	rc = fsi_device_write(dev, FSI_MRESP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	rc = fsi_device_read(dev, FSI_MLEVP0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	/* Reset the master bridge */
-	reg = cpu_to_be32(FSI_MRESB_RST_GEN);
-	rc = fsi_device_write(dev, FSI_MRESB0, &reg, sizeof(reg));
-	if (rc)
-		return rc;
-
-	reg = cpu_to_be32(FSI_MRESB_RST_ERR);
-	return fsi_device_write(dev, FSI_MRESB0, &reg, sizeof(reg));
-}
-
 static int hub_master_probe(struct device *dev)
 {
+	struct regmap_config hub_master_regmap_config;
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct fsi_master_hub *hub;
+	struct regmap *map;
 	uint32_t reg, links;
-	__be32 __reg;
 	int rc;
 
-	rc = fsi_device_read(fsi_dev, FSI_MVER, &__reg, sizeof(__reg));
+	fsi_master_regmap_config(&hub_master_regmap_config);
+	hub_master_regmap_config.reg_base = fsi_dev->addr;
+	map = regmap_init_fsi(fsi_dev, &hub_master_regmap_config);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	rc = regmap_read(map, FSI_MVER, &reg);
 	if (rc)
-		return rc;
+		goto err_regmap;
 
-	reg = be32_to_cpu(__reg);
 	links = (reg >> 8) & 0xff;
 	dev_dbg(dev, "hub version %08x (%d links)\n", reg, links);
 
@@ -213,7 +111,7 @@ static int hub_master_probe(struct device *dev)
 			FSI_HUB_LINK_SIZE * links);
 	if (rc) {
 		dev_err(dev, "can't claim slave address range for links");
-		return rc;
+		goto err_regmap;
 	}
 
 	hub = kzalloc(sizeof(*hub), GFP_KERNEL);
@@ -229,22 +127,25 @@ static int hub_master_probe(struct device *dev)
 	hub->master.dev.parent = dev;
 	hub->master.dev.release = hub_master_release;
 	hub->master.dev.of_node = of_node_get(dev_of_node(dev));
+	hub->master.map = map;
 
 	hub->master.lbus_divider = 1;
 	hub->master.idx = fsi_dev->slave->link + 1;
 	hub->master.n_links = links;
+	hub->master.flags = FSI_MASTER_FLAG_INTERRUPT;
 	hub->master.read = hub_master_read;
 	hub->master.write = hub_master_write;
 	hub->master.send_break = hub_master_break;
-	hub->master.link_enable = hub_master_link_enable;
 
 	dev_set_drvdata(dev, hub);
 
-	hub_master_init(hub);
+	rc = fsi_master_init(&hub->master, fsi_device_local_bus_frequency(fsi_dev));
+	if (rc)
+		goto err_free;
 
 	rc = fsi_master_register(&hub->master);
 	if (rc)
-		goto err_release;
+		goto err_free;
 
 	/* At this point, fsi_master_register performs the device_initialize(),
 	 * and holds the sole reference on master.dev. This means the device
@@ -256,9 +157,13 @@ static int hub_master_probe(struct device *dev)
 	get_device(&hub->master.dev);
 	return 0;
 
+err_free:
+	kfree(hub);
 err_release:
 	fsi_slave_release_range(fsi_dev->slave, FSI_HUB_LINK_OFFSET,
 			FSI_HUB_LINK_SIZE * links);
+err_regmap:
+	regmap_exit(map);
 	return rc;
 }
 
-- 
2.39.3


