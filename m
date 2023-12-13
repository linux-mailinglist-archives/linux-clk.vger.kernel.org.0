Return-Path: <linux-clk+bounces-1034-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41289808FC5
	for <lists+linux-clk@lfdr.de>; Thu,  7 Dec 2023 19:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F04B028173E
	for <lists+linux-clk@lfdr.de>; Thu,  7 Dec 2023 18:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A814D5BB;
	Thu,  7 Dec 2023 18:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Stw1Yw4T"
X-Original-To: linux-clk@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A4A10E3;
	Thu,  7 Dec 2023 10:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701973369; x=1733509369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iCLUUaatBfqlkyFZ3lf+30TefpNxCMzpAtCl5N7SoO4=;
  b=Stw1Yw4TkjgCTLJDqe2i5JsTqevnEexP1rhYHCL68CIJvCMfhQnwy2vF
   b0LSn2xFSl6mAE47fz3oSRvpj9zSTPzo9slAeKuAqXOq5q/Pay3fF5QgF
   wnkSGOS/oIXC+ezkUFWrSvVCbP2Wj9DvmEd/3MmyFwM6kdiB7W4UkER3i
   uTevKBENTAutR4pbM1ADPLfLwlxGPLBLdgwkYH3S8TsNkRrXw86YmuKXs
   YfEDTU6qRYkKgmOsbtm5qHuPvNpt3zoBwrY0lV7x5yJP/RzoW4dSiNh3T
   d4rAHuaSFq0+6w8Hspwe+ZSnItTAjs5AiAL4jiDArTeVwx/iZaQuSUrd8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="458597352"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="458597352"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 10:22:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895233228"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="895233228"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 07 Dec 2023 10:22:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBJ1E-000CfP-0N;
	Thu, 07 Dec 2023 18:22:40 +0000
Date: Fri, 8 Dec 2023 02:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v5 3/4] clk: sophgo: Add SG2042 clock generator driver
Message-ID: <202312080254.Vka7cUVe-lkp@intel.com>
References: <975f9995584dfa8af751e96a1f4d2c7991551a35.1701938395.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <975f9995584dfa8af751e96a1f4d2c7991551a35.1701938395.git.unicorn_wang@outlook.com>

Hi Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-soc-sophgo-Add-Sophgo-system-control-module/20231207-165948
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/975f9995584dfa8af751e96a1f4d2c7991551a35.1701938395.git.unicorn_wang%40outlook.com
patch subject: [PATCH v5 3/4] clk: sophgo: Add SG2042 clock generator driver
config: i386-buildonly-randconfig-002-20231208 (https://download.01.org/0day-ci/archive/20231208/202312080254.Vka7cUVe-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312080254.Vka7cUVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312080254.Vka7cUVe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/sophgo/clk-sophgo-sg2042.c:1273:13: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
                      ^
   drivers/clk/sophgo/clk-sophgo-sg2042.c:1273:13: note: did you mean 'vzalloc'?
   include/linux/vmalloc.h:141:14: note: 'vzalloc' declared here
   extern void *vzalloc(unsigned long size) __alloc_size(1);
                ^
>> drivers/clk/sophgo/clk-sophgo-sg2042.c:1273:11: error: incompatible integer to pointer conversion assigning to 'struct sg2042_clk_data *' from 'int' [-Wint-conversion]
           clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/sophgo/clk-sophgo-sg2042.c:1293:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           kfree(clk_data);
           ^
   drivers/clk/sophgo/clk-sophgo-sg2042.c:1349:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           kfree(clk_data);
           ^
   4 errors generated.


vim +/kzalloc +1273 drivers/clk/sophgo/clk-sophgo-sg2042.c

  1256	
  1257	static int __init sg2042_clk_init_clk_data(
  1258		struct device_node *node,
  1259		int num_clks,
  1260		struct sg2042_clk_data **pp_clk_data)
  1261	{
  1262		int ret = 0;
  1263		struct sg2042_clk_data *clk_data = NULL;
  1264		struct device_node *np_syscon;
  1265	
  1266		np_syscon = of_parse_phandle(node, "sophgo,system-ctrl", 0);
  1267		if (!np_syscon) {
  1268			pr_err("failed to get system-ctrl node\n");
  1269			ret = -EINVAL;
  1270			goto error_out;
  1271		}
  1272	
> 1273		clk_data = kzalloc(struct_size(clk_data, onecell_data.hws, num_clks), GFP_KERNEL);
  1274		if (!clk_data) {
  1275			ret = -ENOMEM;
  1276			goto error_out;
  1277		}
  1278	
  1279		clk_data->regmap_syscon = device_node_to_regmap(np_syscon);
  1280		if (IS_ERR_OR_NULL(clk_data->regmap_syscon)) {
  1281			pr_err("cannot get regmap_syscon %ld\n", PTR_ERR(clk_data->regmap_syscon));
  1282			ret = -ENODEV;
  1283			goto cleanup;
  1284		}
  1285		clk_data->iobase_syscon = of_iomap(np_syscon, 0);
  1286		clk_data->iobase = of_iomap(node, 0);
  1287		clk_data->onecell_data.num = num_clks;
  1288	
  1289		*pp_clk_data = clk_data;
  1290		return ret;
  1291	
  1292	cleanup:
> 1293		kfree(clk_data);
  1294	
  1295	error_out:
  1296		return ret;
  1297	}
  1298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

